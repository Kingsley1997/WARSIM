// [<newUnit>,<oldUnit>,<respawn>,<respawnDelay>]

_unit = _this select 0;
_oldUnit = _this select 1;

removeAllActions _oldUnit;

waitUntil {!isNull _unit};
waitUntil {time > 0};

_unit setVariable["profileName", profileName, true];
_unit setVariable["hasBeenKilled", false, true];
_unit setVariable["hasLoaded", false, true];
_unit setVariable["playerData", [], true];

_unitBaseResp = _unit getVariable ["RESP_BASE", []];
_unitBaseResp call BIS_fnc_removeRespawnPosition;

// execVM "trainer.sqf";
execVM "fn\client\fn_playerActions.sqf";

_unit call fn_defaultLoadout;
_unit call fn_loadPlayerGear;
_unit call fn_buildRespawnPoints;
[_unit, "WSLogo"] call BIS_fnc_setUnitInsignia;

if (WS_CFG_playerFatigue == 1) then {
	_unit enableFatigue true;
} else {
	_unit enableFatigue false;
};