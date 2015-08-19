["Called fn_fobOutro", false] call fn_devLog;

private ["_unit"];

_unit = _this;

if (local _unit) then {
	titleCut ["", "BLACK OUT", 1];
	
	waitUntil { !(isNil "BIS_fnc_init") };
	
	// Info text
	["Headquarters", "Debriefing"] spawn BIS_fnc_infoText;
	
	sleep 3;
	
	_unit setPos (getMarkerPos "hq_spawn");
	
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [6];
	"dynamicBlur" ppEffectCommit 0;
	"dynamicBlur" ppEffectAdjust [0.0];
	"dynamicBlur" ppEffectCommit 3;
	
	titleCut ["", "BLACK IN", 5];
	
	sleep 5;
	
	[_unit, "sfn_promote", false, false, false] call BIS_fnc_MP;
};