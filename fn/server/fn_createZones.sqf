/*
	Author: Kingsley
	Description: Create random zones at the given FOB marker
	Parameter(s):
		0: OBJECT - Player to be used
		1: STRING - FOB marker name (fob1..fob10)
	Returns: BOOLEAN (returns true)
*/

["Creating Zones", false] call fn_devLog;

private ["_unit","_fob","_puid","_isBeingLoaded","_result","_createdZones","_oldPos","_newUnit","_profileName","_unitFileName","_zCounter","_z","_zonName","_zonExists","_zonFormattedName","_zonInt","_zonFob","_zonPos","_zonRadius","_zonStatus","_zonIntensity","_zonDeployments","_markerColor","_aiCount","_newGrp","_i","_target","_dist","_dir","_rot","_pos","_positions","_trgAct","_opPos","_misRadius","_misIntensity","_spot","_spot2","_allow","_op","_mrkName","_trg","_isUsingFob"];

_unit = _this select 0;
_fob = _this select 1;
_puid = getPlayerUID _unit;
_isBeingLoaded = false;
_result = true;
_createdZones = [];
_oldPos = [(getMarkerPos _fob)];
_newUnit = objNull;
_isUsingFob = "";

_profileName = _unit getVariable["profileName", ""];
if (_profileName == "") exitWith {};

_unitFileName = format["%1_%2", _puid, (_profileName call iniDB_CRC32)];

_zCounter = 0;
for "_z" from 0 to WS_CFG_maxZoneCount do {
	["    Zone Loop Repetition", false] call fn_devLog;
	scopeName "zLoop";
	
	_zonName = format["%1_aiZone_%2", _fob, _zCounter];
	_zonExists = ["zones", _zonName, "position", "ARRAY"] call iniDB_read;
	
	if ( count _zonExists > 0 && !(_zonName in _createdZones) ) then {
		// Zones exist in database, proceed to load them
		_zonFormattedName = ["zones", _zonName, "formattedName", "STRING"] call iniDB_read;
		_zonInt = ["zones", _zonName, "zoneInt", "SCALAR"] call iniDB_read;
		_zonFob = ["zones", _zonName, "fob", "STRING"] call iniDB_read;
		_zonPos = ["zones", _zonName, "position", "ARRAY"] call iniDB_read;
		_zonRadius = ["zones", _zonName, "radius", "SCALAR"] call iniDB_read;
		_zonStatus = ["zones", _zonName, "status", "SCALAR"] call iniDB_read; // 1 = EAST CONTROL	2 = WEST CONTROL
		_zonIntensity = ["zones", _zonName, "intensity", "SCALAR"] call iniDB_read;
		_zonDeployments = ["zones", _zonName, "deployments", "SCALAR"] call iniDB_read;
		
		_markerColor = "ColorEAST";
		_aiCount = 0;
		switch (_zonStatus) do {
			case 1: { _markerColor = "ColorEAST"; _aiCount = _zonIntensity; };
			case 2: { _markerColor = "ColorWEST"; _aiCount = 0; };
		};
		
		// Compile AI
		if (_aiCount > 0) then {
			_newGrp = createGroup east;
			_newUnit = objNull;
			
			for "_i" from 1 to _aiCount step 1 do {
				_target = _zonPos;
				_dist = random _zonRadius;
				_dir = random 360;
				_rot = random 360;
				_pos = _target;
				_positions = [(_pos select 0) + (sin _dir) * _dist, (_pos select 1) + (cos _dir) * _dist, 0];
				_newUnit = "O_soldier_F" createUnit [_positions, _newGrp, "[this] call fn_rebelLoadout"];
				_newUnit setDir _rot;
			};
			
			_nul = [(leader _newGrp), _zonFormattedName] execVM "UPS.sqf";
			// [_newGrp, (leader _newGrp), _zonRadius] call BIS_fnc_taskPatrol;
		};
		
		// Create Marker Set
		{ [[_x, _zonName, _zonPos, _zonRadius, _markerColor], "fn_createMarkerLocal", _x, false, true] call BIS_fnc_MP;
		} forEach (_fob call sfn_loadPlayersAtFOB);
		
		_trgAct = format ["[['%1', '%2'], 'sfn_endZone', false, false, true] call BIS_fnc_MP;", _zonName, _fob];
		_trg = createTrigger ["EmptyDetector", _zonPos];
		_trg setTriggerArea [_zonRadius, _zonRadius, 0, false];
		_trg setTriggerActivation ["EAST", "NOT PRESENT", false];
		_trg setTriggerStatements ["this", _trgAct, ""];
		
		["Zone Loaded", false] call fn_devLog;
		
		_zCounter = _zCounter + 1;
		
		_isBeingLoaded = true;
	} else {
		if (_isBeingLoaded) exitWith {};
		
		// Zones not found in database, proceed to create fresh zones
		
		if (_fob == _isUsingFob || _isUsingFob == "") then {
			// Find Random Spot
			_opPos = selectBestPlaces [(getMarkerPos _fob), WS_CFG_zoneScanRadius, WS_CFG_zoneScanString, WS_CFG_zonePrecision, WS_CFG_maxZoneCount];
			
			if (count _opPos > 0) then {
				_misRadius = floor (WS_CFG_maxZoneRadius - (random 200));
				_misIntensity = ceil (_misRadius / 35);
				
				_spot = _opPos select 0;
				_spot2 = _spot select 0;
				_allow = true;
				
				for "_op" from 0 to ((count _oldPos) - 1) do {
					if ((_spot2 distance (_oldPos select _op)) < WS_CFG_minDistZone) then {
						_allow = false;
					};
				};
				
				if (_allow && _zCounter < 10) then {
					_mrkName = format["%1_aiZone_%2", _fob, _zCounter];
					
					["zones", _mrkName, "owner", _unitFileName] call iniDB_write;
					["zones", _mrkName, "fob", _fob] call iniDB_write;
					["zones", _mrkName, "zoneInt", _zCounter] call iniDB_write;
					["zones", _mrkName, "formattedName", _mrkName] call iniDB_write;
					["zones", _mrkName, "position", _spot2] call iniDB_write;
					["zones", _mrkName, "radius", _misRadius] call iniDB_write;
					["zones", _mrkName, "status", "1"] call iniDB_write; // 1 = EAST CONTROL	2 = WEST CONTROL
					["zones", _mrkName, "intensity", _misIntensity] call iniDB_write;
					["zones", _mrkName, "deployments", "1"] call iniDB_write;
					
					_isUsingFob = _fob;

					// Compile AI
					_newGrp = createGroup east;
					_newUnit = objNull;
					
					for "_i" from 1 to _misIntensity step 1 do {
						_target = _spot2;
						_dist = random _misRadius;
						_dir = random 360;
						_rot = random 360;
						_pos = _target;
						_positions = [(_pos select 0) + (sin _dir) * _dist, (_pos select 1) + (cos _dir) * _dist, 0];
						_newUnit = "O_soldier_F" createUnit [_positions, _newGrp, "[this] call fn_rebelLoadout"];
						_newUnit setDir _rot;
					};
					
					_nul = [(leader _newGrp), _mrkName] execVM "UPS.sqf";
					// [_newGrp, (leader _newGrp), _misRadius] call BIS_fnc_taskPatrol;
					
					// Create Marker Set
					{ [[_x, _mrkName, _spot2, _misRadius], "fn_createMarkerLocal", _x, false, true] call BIS_fnc_MP;
					} forEach (_fob call sfn_loadPlayersAtFOB);
					
					_trgAct = format ["[['%1', '%2'], 'sfn_endZone', false, false, true] call BIS_fnc_MP;", _mrkName, _fob];
					_trg = createTrigger ["EmptyDetector", _spot2];
					_trg setTriggerArea [_misRadius, _misRadius, 0, false];
					_trg setTriggerActivation ["EAST", "NOT PRESENT", false];
					_trg setTriggerStatements ["this", _trgAct, ""];
					
					["New Zone Created", false] call fn_devLog;
					
					_createdZones pushBack _mrkName;
					_oldPos pushBack _spot2;
					_zCounter = _zCounter + 1;
				};
			};
		};
	};
};

_result