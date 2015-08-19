private ["_zonName", "_trigVarName", "_hasFinished"];

_zonName = _this select 0;
_trigVarName = _this select 1;
_hasFinished = false;

scopeName "mainHandleZone";

if (_hasFinished) exitWith {};

// Load zone helpers
_zonFormattedName = ["zones", _zonName, "formattedName", "STRING"] call iniDB_read;
_zonInt = ["zones", _zonName, "zoneInt", "SCALAR"] call iniDB_read;
_zonFob = ["zones", _zonName, "fob", "STRING"] call iniDB_read;

deleteVehicle _trigVarName;
["Deleted Trigger", false] call fn_devLog;

["Zone End", false] call fn_devLog;
_zonFormattedName setMarkerColor "ColorWEST";
["zones", _zonFormattedName, "status", "2"] call iniDB_write; // 1 = EAST CONTROL	2 = WEST CONTROL

["Starting Zone Loop", false] call fn_devLog;
_allZonesComplete = true;

for "_z" from 0 to 10 do {
	scopeName "zEndLoop";
	_mrkName = format["%1_aiZone_%2", _zonFob, _z];
	[_mrkName, false] call fn_devLog;
	
	if (getMarkerColor _mrkName == "") then {
		// Marker doesn't exist, gone too far
		_hasFinished = true;
		["Marker doesn't exist, gone too far", false] call fn_devLog;
		breakTo "mainHandleZone";
	} else {
		if (getMarkerColor _mrkName != "ColorWEST") then {
			["Not equal to WEST", false] call fn_devLog;
			_allZonesComplete = false;
		};
	};
};

//if (_misAllZonesComplete) exitWith {};

if (_allZonesComplete) then {
	_hasFinished = true;
	//missionNamespace setVariable [_zonVarName, true, true];
	
	["All Zones Complete", false] call fn_devLog;
	// Tour completed
	{
		if (isPlayer _x) then {
			// Start end tour process for this player (_x)
			if (local _x) then {
				hint "Tour Complete. Well done!";
			};
		};
	} forEach playableUnits;
	
	// Start end tour process for this FOB (_zonFob)
	_randLZ = (getMarkerPos _zonFob) findEmptyPosition [0, 2000, "B_Heli_Transport_03_F"];
	
	if (count _randLZ > 0) then {
			["Found LZ position", false] call fn_devLog;
			
			// [position,direction,type,side or group] call BIS_fnc_spawnVehicle
			
			_hPad = "Land_HelipadEmpty_F" createVehicle _randLZ;
			_heli = [(getMarkerPos "heli_spawn"), 45, "B_Heli_Transport_03_F", west] call BIS_fnc_spawnVehicle;
			
			// Debug
			player moveInCargo _heli select 0;
			
			_heli select 0 call { _heli select 0 allowDamage false; };
			_heliGrp = _heli select 2;
			_wp = _heliGrp addWaypoint [_randLZ, 0];
			_wp setWaypointBehaviour "CARELESS";
			_wp setWaypointCombatMode "RED";
			_wp setWaypointCompletionRadius 0;
			_wp setWaypointFormation "NO CHANGE";
			_wp setWaypointSpeed "FULL";
			_wp setwaypointType "LOAD";
			
			_wpMrkName = format ["%1_LZ", _zonFob];
			_marker = createMarker [_wpMrkName, _randLZ];
			_marker setMarkerShape "ICON";
			_marker setMarkerSize [1, 1];
			_marker setMarkerColor "ColorWEST";
			_marker setMarkerType "hd_pickup";
	} else {
		// Can't find LZ position?
		["Can't find LZ position", false] call fn_devLog;
	};
};