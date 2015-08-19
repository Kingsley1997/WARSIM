_unit = _this;
_puid = getPlayerUID _unit;

["Building Respawn Points", false] call fn_devLog;

_profileName = _unit getVariable["profileName", ""];
if (_profileName == "") exitWith {};
_unitFileName = format["%1_%2", _puid, (_profileName call iniDB_CRC32)];

_misOwner = ["missions", _unitFileName, "owner", "STRING"] call iniDB_read;
_misPos = ["missions", _unitFileName, "position", "STRING"] call iniDB_read;

_unit setVariable ["playerDeployInfo", [_misOwner, _misPos, _unitFileName], true];
_unit setVariable ["hasLoadedRespawn", true, true];

_unit