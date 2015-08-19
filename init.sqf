if (isServer || isDedicated) then {
	call compile preProcessFile "\iniDBI\init.sqf";
};

#include "debug_console.hpp"
#include "fn\definitions.sqf"
#include "ui\init.sqf"

WS_CFG_missionName = "WARSIM";
WS_CFG_terrain = "ALTIS";
WS_CFG_zoneScanString = "(1 + houses) * (1 + forest) * (1 + trees) * (1 - sea)";
WS_CFG_showDebug = if (paramsArray select 0 == 1) then {true} else {false};
WS_CFG_playerFatigue = paramsArray select 1;
WS_CFG_saveInterval = paramsArray select 2;
WS_CFG_rallyPointDelay = paramsArray select 3;
WS_CFG_zonePrecision = paramsArray select 4;
WS_CFG_maxZoneCount = paramsArray select 5;
WS_CFG_minDistZone = paramsArray select 6;
WS_CFG_maxZoneRadius = paramsArray select 7;
WS_CFG_zoneScanRadius = paramsArray select 8;
WS_CFG_vehDelay = paramsArray select 9;
WS_CFG_vehDesertDelay = paramsArray select 10;
WS_CFG_timeZoneOffset = paramsArray select 11;
WS_CFG_airVehicles = ["B_Heli_Attack_01_F","B_UAV_02_CAS_F","B_UAV_02_F","B_Plane_CAS_01_F","B_Heli_Transport_03_F","B_Heli_Transport_01_F","B_Heli_Light_01_armed_F","B_Heli_Light_01_F"];
WS_CFG_armorVehicles = ["B_APC_Wheeled_01_cannon_F","B_APC_Tracked_01_AA_F","B_APC_Tracked_01_rcws_F","B_MBT_01_cannon_F","B_MBT_01_TUSK_F","B_MBT_01_arty_F","B_MBT_01_mlrs_F"];
WS_CFG_startingFobCount = 10; // The exact number of FOBs already placed on the map at mission start. Must be relative to FOB names (eg. fob1..fob10 == WS_CFG_startingFobCount = 10)
WS_CFG_maximumFobCount = 50; // If the number of FOB markers you have exceed this value, those FOBs will not be accounted for

enableSaving [false, false];
_null = [] execVM "auxslingloading.sqf";
_null = [] execVM "restrictVehicles.sqf";
execVM "safety.sqf";

if (isServer || isDedicated) then {
	// Server Init
	setDate call compile ("real_date" callExtension "GMT");
	skipTime WS_CFG_timeZoneOffset;
	execVM "loadObjects.sqf";
	execVM "bases.sqf";
	execVM "fobs.sqf";
	execVM "training.sqf";
	
	// [dead bodies, dead vehicles, immobile vehicles, dropped weapons, planted explosives, smokes/chemlights]
	[60, 0, 0, 2, 0, 0] execVM 'cleanup.sqf';
} else {
	waitUntil {!isNull player};
	waitUntil {time > 0};

	// execVM "trainer.sqf";
	execVM "fn\client\fn_playerActions.sqf";

	player setVariable["profileName", profileName, true];
	player setVariable["hasBeenKilled", false, true];
	player setVariable["hasLoaded", false, true];
	player setVariable["playerData", [], true];
	player setVariable["playerRank", "PRIVATE", true];
	player setVariable["playerRole", "DEFAULT", true];
	player setVariable["RESP_BASE", [], true];
	player setVariable["RESP_RALLY", [], true];
	player setVariable["RESP_OPS", [], true];
	
	player call fn_defaultLoadout;
	player call fn_loadPlayer;
	player call fn_buildRespawnPoints;
	[player, "WSLogo"] call BIS_fnc_setUnitInsignia;
	
	if (WS_CFG_playerFatigue == 1) then {
		player enableFatigue true;
	} else {
		player enableFatigue false;
	};
};