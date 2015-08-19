private ["_zonName","_fobName","_allComplete","_mrkName","_zonPos","_zonRadius","_nearUnits","_tourPlayers","_unit","_puid","_profileName","_unitFileName","_unitRallyResp","_curTourCount","_zy","_zxy","_zx"];

_zonName = _this select 0;
_fobName = _this select 1;

_allComplete = true;

for "_zy" from 0 to WS_CFG_maxZoneCount do {
	_mrkName = format["%1_aiZone_%2", _fobName, _zy];
	_zonPos = ["zones", _mrkName, "position", "ARRAY"] call iniDB_read;
	_zonRadius = ["zones", _mrkName, "radius", "SCALAR"] call iniDB_read;
	_nearUnits = (getMarkerPos _mrkName) nearEntities ["Man", _zonRadius];
	
	if (count _nearUnits > 0) then {
		{
			if (side _x == east && alive _x) then {
				_allComplete = false;
			};
		} forEach _nearUnits;
	};
};

if (_allComplete) then {
	// Delete all FOB zones
	for "_zxy" from 0 to WS_CFG_maxZoneCount do {
		_mrkName = format["%1_aiZone_%2", _fobName, _zxy];
		["zones", _mrkName] call iniDB_deletesection;
	};
	
	// Return array of all player objects on this deployment
	_tourPlayers = _fobName call sfn_loadPlayersAtFOB;
	
	{
		_unit = _x;
		_puid = getPlayerUID _unit;
		_profileName = _unit getVariable["profileName", ""];
		if (_profileName == "") exitWith {};
		_unitFileName = format["%1_%2", _puid, (_profileName call iniDB_CRC32)];
		
		// Remove rally point respawn position
		_unitRallyResp = _unit getVariable ["RESP_RALLY", []];
		_unitRallyResp call BIS_fnc_removeRespawnPosition;
		
		// Increment players tour count by 1
		_curTourCount = ["profiles", _unitFileName, "tourCount", "SCALAR"] call iniDB_read;
		["profiles", _unitFileName, "tourCount", (_curTourCount + 1)] call iniDB_write;
		
		// Delete players mission record
		["missions", _unitFileName] call iniDB_deletesection;
		
		// Delete all zone markers
		for "_zx" from 0 to WS_CFG_maxZoneCount do {
			_mrkName = format["%1_aiZone_%2", _fobName, _zx];
			[[_unit, _mrkName], "fn_deleteMarkerLocal", _unit, false, true] call BIS_fnc_MP;
		};
		
		// Spawn FOB outro
		[_unit, "fn_fobOutro", _unit, false, false] call BIS_fnc_MP;
	} forEach _tourPlayers;
} else {
	_zonName setMarkerColor "ColorWEST";
	["zones", _zonName, "status", "2"] call iniDB_write;
};