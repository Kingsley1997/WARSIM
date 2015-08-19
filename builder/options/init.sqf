private ["_display","_unit","_idc","_ctrl"];

_display = _this select 0 select 0;
_unit = player;
_idc = -1;
_ctrl = _display displayCtrl _idc;

_slider = _display displayCtrl 1900;

_slider sliderSetRange [0, 360];