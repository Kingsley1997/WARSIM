private ["_class", "_unit"];

_class = _this;
_unit = player;

if (local _unit) then {
	_unit addPrimaryWeaponItem _class;
};