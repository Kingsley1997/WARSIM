private ["_display","_listBox","_unit","_selIndex","_selText","_selData","_mrkName","_casPos"];

disableSerialization;

_display = findDisplay 9563;
_listBox = _display displayCtrl 1500;
_unit = player;

if (lbCurSel _listBox != -1) then {
	_selIndex = lbCurSel _listBox;
	_selText = _listBox lbText _selIndex;
	_selData = _listBox lbData _selIndex;
	_mrkName = format ["WSGUICAS_LOC_%1", _selText];
	_casPos = getMarkerPos _mrkName;
	[[_casPos, _selData], "ui_cancelGlobalRequest", ([_selData] call BIS_fnc_getUnitByUid), false, true] call BIS_fnc_MP;
	if (local _unit) then {
		hint "Air support request cancelled.";
	};
} else {
	if (local _unit) then {
		hint "You must select a unit on the left first.";
	};
};

