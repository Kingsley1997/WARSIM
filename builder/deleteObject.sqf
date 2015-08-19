private ["_unit", "_obj"];

_obj = _this select 0;
_unit = _this select 1;

[_obj, "sfn_deleteObject", false, false, true] call BIS_fnc_MP;