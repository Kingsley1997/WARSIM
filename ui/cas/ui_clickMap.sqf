private ["_display","_position","_listBox","_unit","_selText","_mrkName","_marker"];

disableSerialization;

_display = findDisplay 9563;
_position = _this select 0 ctrlMapScreenToWorld [ (_this select 2), (_this select 3) ];
_listBox = _display displayCtrl 1500;
_unit = player;

if (lbCurSel _listBox != -1) then {
	_selText = _listBox lbText lbCurSel _listBox;
	_mrkName = format ["WSGUICAS_LOC_%1", _selText];
	
	{
		deleteMarkerLocal _mrkName;
		_marker = createMarkerLocal [_mrkName, _position];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "mil_destroy";
		_marker setMarkerSizeLocal [1, 1];
		_marker setMarkerColorLocal "ColorWest";
	} forEach units group _unit;
} else {
	if (local _unit) then {
		hint "You must select a unit on the left first.";
	};
};