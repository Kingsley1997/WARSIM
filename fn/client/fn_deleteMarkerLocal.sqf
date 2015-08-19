private ["_unit", "_mrkName"];

_unit = [_this, 0, player] call BIS_fnc_param;
_mrkName = [_this, 1, ""] call BIS_fnc_param;

if (local _unit) then {
	deleteMarkerLocal _mrkName;
};