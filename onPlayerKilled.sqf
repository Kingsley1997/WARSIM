// [<oldUnit>,<killer>,<respawn>,<respawnDelay>]

_unit = _this select 0;

if (!local _unit) exitWith {};

_unit setVariable["hasBeenKilled", true, true];

_unitBaseResp = _unit getVariable ["RESP_BASE", []];
_unitBaseResp call BIS_fnc_removeRespawnPosition;

_unit call fn_buildRespawnPoints;