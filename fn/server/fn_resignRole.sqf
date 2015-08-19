private ["_unit", "_puid", "_profileName", "_unitFileName"];

_unit = _this;
_puid = getPlayerUID _unit;

_profileName = _unit getVariable["profileName", ""];
if (_profileName == "") exitWith {};
_unitFileName = format["%1_%2", _puid, (_profileName call iniDB_CRC32)];

["profiles", _unitFileName, "role", "DEFAULT"] call iniDB_write;