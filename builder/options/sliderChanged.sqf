private ["_control", "_position"];

_control = _this select 0 select 0;
_position = _this select 0 select 1;

hint str _position;

{
	_x setDir _position;
} forEach attachedObjects player;
