/*
* KennuX's Heli Extraction Script
* Features:
* - Spawns helicopters randomly at given positions
* - Helicopters fly to extraction Zone and wait for all units in the given group
* - Dynamic helicopter count based on the helicopter type and the ammount of units to extract
* - Helicopter(s) will move to the extraction target after units got in
* - Callback can get passed to the script. It will get executed after all helicopters started landing
*
* Usage:
*
* IMPORTANT: 
* For multiplayer missions you have to execute this script on the server!
* To call the extraction Heli(s) for a group, execute the following sqf core:
* [group, heli spawnposition, extraction point, extraction target, heli classname, (Option) Landing Mode ,(Optional) Callbacks] execVM "extraction.sqf";
*
* Example:
* [group player, (getMarkerPos "HeliSpawn"), (getMarkerPos "ExtractionPoint"), (getMarkerPos "ExtractionTarget"), "B_MH9_F"] execVM "extraction.sqf";
* With callbacks + landing mode
* [group player, (getMarkerPos "HeliSpawn"), (getMarkerPos "ExtractionPoint"), (getMarkerPos "ExtractionTarget"), "B_MH9_F", "GET IN", [{ hintSilent "SPAWNED!"; }, { hintSilent "LANDED AT EXTRACTION POINT!"; }, { hintSilent "LANDED AT EXTRACTION TARGET!"; }]] execVM "extraction.sqf";
* Without callbacks, with landing mode
* [group player, (getMarkerPos "HeliSpawn"), (getMarkerPos "ExtractionPoint"), (getMarkerPos "ExtractionTarget"), "B_MH9_F", "GET IN", [{ }, { }, { }]] execVM "extraction.sqf";
* 
* Landing mode:
* "LAND" (complete stop) - Default
* "GET IN" (hovering very low, for another unit to get in)
* "GET OUT" (hovering low,for another unit to get out)
* "NONE" (cancel a landing) Available since ArmA 2 57463 build.
* More Information: https://community.bistudio.com/wiki/land
*
* Callbacks:
* Default callbacks are [{ }, { }, { }]
* 
* Callbacks get executed by this code:
* [_helicopters] call _callback <- _helicopters are all helicopter vehicles in an array
* 
* First callback is the spawned callback, gets executed after helicopters got spawned.
* Second callback is the extraction callback, gets executed after the helicopters landed at the extraction point
* Third callback is the extraction done callback, gets executed after the helicopters landed at the extraction target
*
* Pass default values for optional arguments you wont change
*/

// Static functions
_fnc_spawn_helipad = {
	// Get Arguments
	_spawnPoint = _this select 0;
	_radius = _this select 1;
	_spawnHelipad = 1;
	_rndHelipadPosition = [];
	
	// Get spawn position
	while { _spawnHelipad > 0 } do {
		_rndHelipadPosition = [_spawnPoint, 0, _radius, 5, 1, 2000, 0] call BIS_fnc_findSafePos;
		_spawnHelipad = count (nearestObjects [_rndHelipadPosition, ["HeliH"], _radius]);
	};
	
	// Return position
	_rndHelipadPosition
};

_fnc_flyto_target = {
	// Get Arguments
	_targetPosition = _this select 0;
	_heli = _this select 1;
	
	_heli doMove _targetPosition;
	
	// Wait for heli to get near the heli pads
	while { _heli distance _targetPosition > 200 } do { sleep 1; };
	
	// Land heli
	doStop _heli;
	_heli land "LAND";
};

// Get arguments
_callbacks = [{ }, { }, { }];
_landingMode = "LAND";
_group = _this select 0;
_spawnPosition = _this select 1;
_extractionPoint = _this select 2;
_extractionTarget = _this select 3;
_heliClassname = _this select 4;

if ((count _this) >= 6) then {
	_landingMode = _this select 5;
};

if ((count _this) >= 7) then {
	_callbacks = _this select 6;
};

// Callbacks
_spawnCallback = _callbacks select 0;
_extractCallback = _callbacks select 1;
_extractDoneCallback = _callbacks select 2;

// Get the count of helis to spawn.
_transportSoldiers = getNumber(configfile >> "CfgVehicles" >> _heliClassname >> "transportSoldier");
_soldiersInGroup = count _group;
_helisToSpawn = ceil(_soldiersInGroup / _transportSoldiers);

// Needed variables
_helisStarted = 0;
_helipads = [];
_helipadsTarget = [];
_extractionHelis = [];

// Spawn helicopters
for [{_i = 0},{_i<_helisToSpawn}, {_i=_i+1}] do {
	_helicopterPosition = [_spawnPosition, 0, _helisToSpawn*25, 0, 1, 50*(pi/180), 0] call BIS_fnc_findSafePos;

	// Get Helipad spawn coordinates
	_helipadPosition = [_extractionPoint, _helisToSpawn*10] call _fnc_spawn_helipad;
	
	// Spawn helipad
	"HeliH" createVehicle _helipadPosition;
	
	// Spawn extraction target helipoint
	_helipadPositionTarget = [_extractionTarget, _helisToSpawn*10] call _fnc_spawn_helipad;
	
	// Spawn helipad
	"HeliH" createVehicle _helipadPositionTarget;
	
	_helipads set [_i, _helipadPosition];
	_helipadsTarget set [_i, _helipadPositionTarget];
	
	_helicopter = [_helicopterPosition, random 360, "B_Heli_Transport_03_F", west] call BIS_fnc_spawnVehicle;
	
	_extractionHelis set [_i, (_helicopter select 0)];
};

// Execute spawned callback
[_extractionHelis] call _spawnCallback;

// Move helicopters towards the extraction point
_i = 0;
{
	_x doMove (_helipads select _i);
	_i = _i + 1;
} forEach _extractionHelis;

// Wait for them to be ready to land
_helicoptersLanding = 0;
_helicoptersLandingArray = + _extractionHelis;
while { _helicoptersLanding < _helisToSpawn } do {
	// Check all helis for being close enough to land
	{
		if ( ! isNull _x) then {
			_heliIndex = _helicoptersLandingArray find _x;
			if ((_x distance (_helipads select _heliIndex)) < 180) then {
				// Heli is close enough to land
				doStop _x;
				
				_x land _landingMode;
				
				// Register landing
				_helicoptersLanding = _helicoptersLanding + 1;
				_helicoptersLandingArray set [_heliIndex, objNull];
			};
		};
	} forEach _helicoptersLandingArray;
	
	sleep 1;
};

// Wait for all helicopters to be on the ground
{
	waitUntil { isTouchingGround _x };
} forEach _extractionHelis;

// Extract callback
[_extractionHelis] call _extractCallback;

// Wait for all units to get into the helicopters
_unitsExtracted = 0;
_unitsToExtract = _soldiersInGroup;
_extractHelisWaiting = + _extractionHelis;
while { _unitsExtracted < _unitsToExtract } do {
	{
		_heli = _x;
		if ( ! isNull _heli) then {
			_unitsInHelicopter = 0;
			{
				if (vehicle _x == _heli) then {
					// Count all units
					_unitsInHelicopter = _unitsInHelicopter + 1;
				};
			} forEach _group in _heli;
			
			_extractionHeliIndex = _extractHelisWaiting find _heli;
			
			if (_unitsInHelicopter == _transportSoldiers OR _unitsInHelicopter == (_unitsToExtract - _unitsExtracted)) then {
				// Start helicopter
				[_extractionTarget, _heli] spawn _fnc_flyto_target;
				
				// Set heli and units as extracted
				_unitsExtracted = _unitsExtracted + _unitsInHelicopter;
				_extractHelisWaiting set [_extractionHeliIndex, objNull];
			};
		};
	} forEach _extractHelisWaiting;
	sleep 5;
};

// Wait for all helicopters to be on the ground
{
	waitUntil { isTouchingGround _x };
} forEach _extractionHelis;

// Extract callback
[_extractionHelis] call _extractDoneCallback;