private ["_unit", "_class", "_puid"];

_unit = _this select 0;
_class = _this select 1;
_puid = getPlayerUID _unit;

_profileName = _unit getVariable["profileName", ""];
if (_profileName == "") exitWith {};

_unitFileName = format["%1_%2", _puid, (_profileName call iniDB_CRC32)];

["profiles", _unitFileName, "role", _class] call iniDB_write;

["Role Saved", false] call fn_devLog;