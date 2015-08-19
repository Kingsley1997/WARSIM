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

	_isInBase = false;
	if ((_unit distance baseLogic) < 1500) then { _isInBase = true; };

	if (_isInBase) then {
		if (local _unit) then {
			hint "You cannot place rally points inside your base!";
		};
	} else {
		_nObject = nearestObject [_unit, "Land_TentDome_F"];

		if ( isNull _nObject ) then {
			_unit switchmove "AinvPknlMstpSnonWrflDnon_medic";
			
			sleep _delay;
		
			_rallyData = group _unit getVariable ["rallyPointData", []];

			_unit switchmove "AinvPknlMstpSnonWrflDnon_medicEnd";
			_obj1 = "Land_TentDome_F" createVehicle (position _unit);
			_obj2 = "Campfire_burning_F" createVehicle (position _unit);
			
			//_obj1 addAction ["<t color='#FF8800'>Remove Rally Point</t>", "ui\menu\fn_deleteRallyPoint.sqf"];
			
			group _unit setVariable ["rallyPointData", [_obj1, _obj2], true];
			
			_RESP_RALLY = _unit getVariable["RESP_RALLY", []];
			_RESP_RALLY call BIS_fnc_removeRespawnPosition;
			
			_newRallyResp = [group _unit, position _obj1] call BIS_fnc_addRespawnPosition;
			_unit setVariable["RESP_RALLY", _newRallyResp, true];
			
			_t = floor dayTime;
			
			if ( (_t > 5) && (_t < 18) ) then {
				_obj2 inflame false;
			} else {
				_obj2 inflame true;
			};
		} else {
			if (local _unit) then {
				hint "There is already a rally point nearby";
			};
		};
	};
};
