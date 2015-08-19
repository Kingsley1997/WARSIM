private ["_zonName", "_radiusToCheck", "_fobName"];

_zonName = _this select 0;
_radiusToCheck = _this select 1;
_fobName = _this select 2;
_zonVarName = _this select 3;

[[_zonName, _radiusToCheck, _fobName, _zonVarName], "sfn_handleZone", false, false, true] call BIS_fnc_MP;