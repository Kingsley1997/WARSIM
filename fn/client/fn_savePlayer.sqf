_unit = _this;
_loadout = [_unit] call fn_getLoadout;

[[_unit, _loadout], "sfn_savePlayer", false, false, false] call BIS_fnc_MP;