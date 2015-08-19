private ["_zonName"];

_zonName = _this select 0;

[_zonName, "sfn_endZone", false, false, true] call BIS_fnc_MP;