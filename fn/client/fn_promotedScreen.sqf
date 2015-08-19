private ["_unit", "_rank"];

disableSerialization;

_unit = _this select 0;
_rank = _this select 1;

if (local _unit) then {
	_unit say3D "WS_SND_Promoted";
	
	createDialog "WS_GUI_Progression";
	
	_display = findDisplay 456321;
	
	_CT_STRTEXT = _display displayctrl 1100;
	
	_rankIcon = [_rank, "texture"] call BIS_fnc_rankParams;
	
	_rankText = format ["You have been promoted to %1. Go to the training board to see what roles have opened up for you!", _rank];
	
	ctrlSetText [1200, _rankIcon];
	
	_CT_STRTEXT ctrlSetStructuredText parseText format ["<t size='1'>%1</t>", _rankText];
};