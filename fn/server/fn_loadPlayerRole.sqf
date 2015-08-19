private ["_unit", "_puid", "_profileName", "_unitFileName", "_prRole"];

_unit = _this;
_puid = getPlayerUID _unit;

_profileName = _unit getVariable["profileName", ""];
if (_profileName == "") exitWith {};

_unitFileName = format["%1_%2", _puid, (_profileName call iniDB_CRC32)];

_prRole = ["profiles", _unitFileName, "role", "STRING"] call iniDB_read;

_unit setVariable["playerRole", _prRole, true];
_unit setVariable["hasLoadedPlayerRole", true, true];

_prRole