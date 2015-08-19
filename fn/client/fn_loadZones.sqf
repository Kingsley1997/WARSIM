/*
	Author: Kingsley
	Description: Loads the zones for the given FOB
	Parameter(s):
		0: OBJECT - player to be used
		1: STRING - FOB marker name (fob1..fob10)
	Returns: Nothing
*/

private ["_unit","_fob","_zmExists","_zmName","_zm"];

_unit = _this select 0;
_fob = _this select 1;

// Check if the zones have already spawned for this FOB
_zmExists = false;

for "_zm" from 0 to WS_CFG_maxZoneCount do {
	_zmName = format["%1_aiZone_%2", _fob, _zm];
	if (getMarkerColor _zmName != "") then {
		_zmExists = true;
	};
};

if (!_zmExists) then {
	// Zones don't exist, start creating them
	[ [ [_unit, _fob], "fn\server\fn_createZones.sqf" ], "BIS_fnc_execVM", false, false ] call BIS_fnc_MP;
};