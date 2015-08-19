private ["_unit"];

_unit = _this select 0;

if (local _unit) then {
	[_unit, "sfn_resignRole", false, false, true] call BIS_fnc_MP;
	_unit setVariable ["playerRole", "DEFAULT", true];
	"Rifleman" call ui_selectItem;
	["You have resigned from your role. You have been given the default rifleman loadout.", "Notice"] call BIS_fnc_guiMessage;
};