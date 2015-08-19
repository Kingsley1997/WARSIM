/*
	Author: Kingsley
	Description: Saves a players data to the database. This is a persistence function.
	Parameter(s): OBJECT - Player to be saved
	Returns: BOOLEAN (returns true)
*/

private ["_unit", "_puid", "_result", "_profileName", "_unitFileName"];

_unit = _this select 0;
_loadoutToSave = _this select 1;
_puid = getPlayerUID _unit;
_result = [];

_profileName = _unit getVariable["profileName", ""];
if (_profileName == "") exitWith {};

_unitFileName = format["%1_%2", _puid, (_profileName call iniDB_CRC32)];

_useRank = _unit getVariable ["playerRank", "PRIVATE"];

["profiles", _unitFileName, "position", (getPos _unit)] call iniDB_write;
["profiles", _unitFileName, "rotation", (getDir _unit)] call iniDB_write;
["profiles", _unitFileName, "loadout", _loadoutToSave] call iniDB_write;
["profiles", _unitFileName, "rank", _useRank] call iniDB_write;

_result = true;

["Character Saved", false] call fn_devLog;

_result