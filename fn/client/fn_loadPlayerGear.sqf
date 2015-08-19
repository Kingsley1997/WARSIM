_unit = _this;

[_unit, "sfn_loadPlayerGear", false, false, true] call BIS_fnc_MP;

waitUntil { _unit getVariable["hasLoaded", false] };

_hasLoaded = _unit getVariable["hasLoaded", false];
_playerData = _unit getVariable["playerDataAfterRespawn", []];

if (count _playerData > 0 && _hasLoaded) then {
	// [ rank, loadout ]
	[_unit, (_playerData select 1)] call fn_setLoadout;
	_unit setRank (_playerData select 0);
	
	while { alive _unit } do {
		_unit spawn fn_savePlayer;
		sleep WS_CFG_saveInterval;
	};
};