private ["_unit", "_sign"];

_sign = _this select 0;
_unit = _this select 1;

if (local _unit) then {
	createDialog "WS_GUI_Jobs_S";
	ctrlEnable [1600, false];
	ctrlEnable [1601, false];
	ctrlEnable [1602, false];
	ctrlEnable [1603, false];
};