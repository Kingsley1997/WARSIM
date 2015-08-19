/*
	Author: Kingsley
	Description: Loads a players information from the database. This is a persistence function.
	Parameter(s): OBJECT - Player to be loaded
	Returns: ARRAY in format [ position, rotation, rank, tourCount, dateJoined, loadout, isNewPlayer, role ]
*/

private ["_unit", "_puid", "_result", "_profileName", "_unitFileName", "_prRank", "_pPos", "_pLoadout", "_pRank", "_pRot"];

_unit = _this select 0;
_unitLoadout = _this select 1;
_puid = getPlayerUID _unit;
_result = [];

_profileName = _unit getVariable["profileName", ""];
if (_profileName == "") exitWith {};

_unitFileName = format["%1_%2", _puid, (_profileName call iniDB_CRC32)];

_prRank = ["profiles", _unitFileName, "rank", "STRING"] call iniDB_read;

if (_prRank == "") then {
	["profiles", _unitFileName, "position", (getPos _unit)] call iniDB_write;
	["profiles", _unitFileName, "rotation", (getDir _unit)] call iniDB_write;
	["profiles", _unitFileName, "loadout", _unitLoadout] call iniDB_write;
	["profiles", _unitFileName, "rank", "PRIVATE"] call iniDB_write;
	["profiles", _unitFileName, "tourCount", "0"] call iniDB_write;
	["profiles", _unitFileName, "dateJoined", date] call iniDB_write;
	["profiles", _unitFileName, "role", "DEFAULT"] call iniDB_write;
	
	_unit setVariable["playerData", [
		(getPos _unit),
		(getDir _unit),
		"PRIVATE",
		"0",
		date,
		_unitLoadout,
		true,
		"DEFAULT"
	], true];
	
	["Character Created", false] call fn_devLog;
	_result = true;
} else {
	_pPos = ["profiles", _unitFileName, "position", "ARRAY"] call iniDB_read;
	_pLoadout = ["profiles", _unitFileName, "loadout", "ARRAY"] call iniDB_read;
	_pRank = ["profiles", _unitFileName, "rank", "STRING"] call iniDB_read;
	_pRot = ["profiles", _unitFileName, "rotation", "SCALAR"] call iniDB_read;
	_pTours = ["profiles", _unitFileName, "tourCount", "SCALAR"] call iniDB_read;
	_pDate = ["profiles", _unitFileName, "dateJoined", "STRING"] call iniDB_read;
	_pRole = ["profiles", _unitFileName, "role", "STRING"] call iniDB_read;
	
	_unit setVariable["playerData", [
		_pPos,
		_pRot,
		_pRank,
		_pTours,
		_pDate,
		_pLoadout,
		false,
		_pRole
	], true];
	
	["Character Loaded", false] call fn_devLog;
	
	_result = true;
};

_unit setVariable["hasLoaded", _result, true];

_result