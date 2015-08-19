private ["_unit", "_puid", "_profileName", "_unitFileName", "_prRank"];

_unit = _this;
_puid = getPlayerUID _unit;

_profileName = _unit getVariable["profileName", ""];
if (_profileName == "") exitWith {};

_unitFileName = format["%1_%2", _puid, (_profileName call iniDB_CRC32)];

_prRank = ["profiles", _unitFileName, "rank", "STRING"] call iniDB_read;

_unit setVariable["playerRank", _prRank, true];
_unit setVariable["hasLoadedPlayerRank", true, true];

_prRank