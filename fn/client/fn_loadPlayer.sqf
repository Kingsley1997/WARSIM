_unit = _this;
_loadout = [_unit] call fn_getLoadout;

[[_unit, _loadout], "sfn_loadPlayer", false, false, true] call BIS_fnc_MP;

waitUntil { _unit getVariable["hasLoaded", false] };

_hasLoaded = _unit getVariable["hasLoaded", false];
_playerData = _unit getVariable["playerData", []];

if (count _playerData > 0 && _hasLoaded) then {
	// [ position, rotation, rank, tourCount, dateJoined, loadout, isNewPlayer, role ]
	_unit setPos (_playerData select 0);
	_unit setDir (_playerData select 1);
	_unit setRank (_playerData select 2);
	[_unit, _playerData select 5] call fn_setLoadout;
	[_unit, "WSLogo"] call BIS_fnc_setUnitInsignia;
	
	_unit setVariable ["playerRank", _playerData select 2, true];
	_unit setVariable ["playerRole", _playerData select 7, true];
	
	if (_playerData select 6) then {
		// New Player Intro
	};
	
	_null = [_unit, false] execVM "fn\client\fn_loadDeployment.sqf";
	
	while { alive _unit } do {
		_unit spawn fn_savePlayer;
		sleep WS_CFG_saveInterval;
	};
};
