_unit = _this;

if (!local _unit) exitWith {};

[_unit, "sfn_buildRespawnPoints", false, false, true] call BIS_fnc_MP;

waitUntil { _unit getVariable ["hasLoadedRespawn", false] };

_respData = _unit getVariable ["playerDeployInfo", []];

if (count _respData > 0) then {
	// [owner, pos, player_uid]
	
	_unitBaseResp = _unit getVariable ["RESP_BASE", []];
	_unitBaseResp call BIS_fnc_removeRespawnPosition;
	
	_preOps = _unit getVariable ["RESP_OPS", []];
	{
		_x call BIS_fnc_removeRespawnPosition;
	} forEach _preOps;
	
	if ((_respData select 0) == "") then {
		// HQ Respawn
		_newBaseResp = [_unit, "hq_spawn"] call BIS_fnc_addRespawnPosition;
		_unit setVariable ["RESP_BASE", _newBaseResp, true];
	} else {
		// FOB Respawn
		_newBaseResp = [_unit, (_respData select 1)] call BIS_fnc_addRespawnPosition;
		_unit setVariable ["RESP_BASE", _newBaseResp, true];
		
		_fobPos = getMarkerPos (_respData select 1);
		_nearFlags = [_fobPos, 5000] call fn_closestOps;
		if (count _nearFlags > 0) then {
			{
				_newOpResp = [_unit, _x] call BIS_fnc_addRespawnPosition;
				_preOps = _unit getVariable ["RESP_OPS", []];
				_preOps pushBack _newOpResp;
				_unit setVariable ["RESP_OPS", _preOps, true];
			} forEach _nearFlags;
		};
	};
};