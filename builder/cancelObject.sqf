private ["_unit", "_object"];

_unit = _this select 1;
_allObjects = attachedObjects _unit;

if (local _unit) then {
	_unit removeAction (_unit getVariable ["WS_BUILDER_RELEASE_Index", 0]);
	_unit removeAction (_unit getVariable ["WS_BUILDER_OPTIONS_Index", 0]);
	_unit removeAction (_unit getVariable ["WS_BUILDER_CANCEL_Index", 0]);
	
	{
		deleteVehicle _x;
		detach _x;
	} forEach _allObjects;
};