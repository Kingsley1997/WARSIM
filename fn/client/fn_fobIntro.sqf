["Called fn_fobIntro", false] call fn_devLog;

private ["_unit", "_fob"];

_unit = [_this, 0, player] call BIS_fnc_param;
_fob = [_this, 1, "fob1"] call BIS_fnc_param;
_tours = [_this, 2, 0] call BIS_fnc_param;

if (local _unit) then {
	_tourText = format ["Tour #%1", _tours];
	
	sleep 1;
	
	_unit say3D "WS_SND_FobIntro";
	
	titleCut ["", "BLACK OUT", 1];
	
	waitUntil { !(isNil "BIS_fnc_init") };
	
	// Info text
	[markerText _fob, _tourText] spawn BIS_fnc_infoText;
	
	sleep 3;
	
	_unit setPos (getMarkerPos _fob);
	
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [6];
	"dynamicBlur" ppEffectCommit 0;
	"dynamicBlur" ppEffectAdjust [0.0];
	"dynamicBlur" ppEffectCommit 3;
	
	titleCut ["", "BLACK IN", 5];
	
	hint parseText format ["<t size='1.5'>%1</t><br /><t>Welcome to your new home. Once settled you should check your map to see what territory the enemy holds. Take back each zone in your own time and once you're all complete we'll bring you back to HQ.</t>", markerText _fob];
};