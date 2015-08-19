/*
	Author: Kingsley
	Description: Loads a players information from the database. This is a persistence function.
	Parameter(s): OBJECT - Player to be loaded
	Returns: ARRAY in format [ position, rotation, rank, tourCount, dateJoined, loadout, isNewPlayer ]
*/

private ["_unit", "_puid", "_result", "_profileName", "_unitFileName", "_prRank", "_pPos", "_pLoadout", "_pRank", "_pRot"];

_unit = _this;
_puid = getPlayerUID _unit;
_result = [];

_profileName = _unit getVariable["profileName", ""];
if (_profileName == "") exitWith {};

_unitFileName = format["%1_%2", _puid, (_profileName call iniDB_CRC32)];

_prRank = ["profiles", _unitFileName, "rank", "STRING"] call iniDB_read;

if (_prRank != "") then {
	_pLoadout = ["profiles", _unitFileName, "loadout", "ARRAY"] call iniDB_read;
	_pRank = ["profiles", _unitFileName, "rank", "STRING"] call iniDB_read;
	
	_unit setVariable["playerDataAfterRespawn", [
		_pRank,
		_pLoadout
	], true];
	
	["Character Loaded", false] call fn_devLog;
	
	_result = true;
};

_unit setVariable["hasLoaded", _result, true];

_result