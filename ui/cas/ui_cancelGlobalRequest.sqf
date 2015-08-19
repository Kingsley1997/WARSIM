_casPos = _this select 0;
_unit = _this select 1;

_unitObj = [_unit] call BIS_fnc_getUnitByUid;
_name = format ["%1 (%2)", name _unitObj, (getText (configFile >> "CfgVehicles" >> (typeOf vehicle _unitObj) >> "displayName"))];
_mrkName = format ["WSGUICAS_LOC_%1", _name];

deleteMarkerLocal _mrkName;

["TaskCancelled", ["", "Air support request has been cancelled!"]] call BIS_fnc_showNotification;

_unitObj setVariable ["WSGUICAS_LOC", "", true];
_actIndex = _unitObj getVariable ["WSGUICAS_LOC_INDEX", 0];
_unitObj removeAction _actIndex;