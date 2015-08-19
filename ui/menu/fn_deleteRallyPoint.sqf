/*
Land_WoodPile_F
Campfire_burning_F
Land_Ground_sheet_folded_khaki_F
Land_Sleeping_bag_F
Land_TentDome_F
*/

_unit = player;

if (local _unit) then {
	_delay = WS_CFG_rallyPointDelay;

	_unit switchmove "AinvPknlMstpSnonWrflDnon_medic";

	sleep _delay;
	
	_rallyData = group _unit getVariable ["rallyPointData", []];
	
	if (count _rallyData > 0) then {
		deleteVehicle (_rallyData select 0);
		deleteVehicle (_rallyData select 1);
	};
	
	group _unit setVariable ["rallyPointData", [], true];
	
	_RESP_RALLY = _unit getVariable["RESP_RALLY", [0,0]];
	_RESP_RALLY_ID = _RESP_RALLY select 1;
	[group _unit, _RESP_RALLY_ID] call BIS_fnc_removeRespawnPosition;
};