private ["_display","_unit","_idc","_ctrl"];

disableSerialization;

_display = _this select 0;
_unit = player;
_idc = -1;
_ctrl = _display displayCtrl _idc;

_strText = _display displayCtrl 1100;
_textBox = _display displayCtrl 1400;
_accBtn = _display displayCtrl 1600;

_accBtn ctrlEnable false;

_strText ctrlSetStructuredText parseText "<br /><t align='CENTER' size='1'>YOUR NEW OP NAME</t><br /><t align='CENTER' size='1.25'>ENTER TEXT BELOW</t>";