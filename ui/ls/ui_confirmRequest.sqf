private ["_display","_listBox","_unit","_selIndex","_selText","_selData","_mrkName","_lsPos"];

disableSerialization;

_display = findDisplay 9584;
_listBox = _display displayCtrl 1500;
_unit = player;

if (lbCurSel _listBox != -1) then {
	_selIndex = lbCurSel _listBox;
	_selText = _listBox lbText _selIndex;
	_selData = _listBox lbData _selIndex;
	_mrkName = format ["WSGUILS_LOC_%1", _selText];
	_lsPos = getMarkerPos _mrkName;
	[[_lsPos, _selData, 250], "sfn_createSupplyDrop", false, false, false] call BIS_fnc_MP;
	if (local _unit) then {
		sleep 1;
		hint "Your chosen support will be paradropped onto the marked location.";
		deleteMarker _mrkName;
	};
} else {
	if (local _unit) then {
		hint "You must select a support type on the left first.";
	};
};

