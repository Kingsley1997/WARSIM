if (!isServer || !isDedicated) exitWith {};

_vehicleRespawnDelay = 5;
_vehicleDesertedDelay = 5;

for "_i" from 1 to WS_CFG_maximumFobCount step 1 do {
	_fobName = format["fob%1", _i];
	
	if (getMarkerColor _fobName != "") then {
		_fobFlagPos = (getMarkerPos _fobName);
		
		_fobFlag = "Flag_UK_F" createVehicle _fobFlagPos;
		// _fobFlag addAction ["<t color='#0072bb'>Retire Deployment</t>", "fn\mission\retire.sqf"];
		
		// B_Quadbike_01_F
		_quadPosition = _fobFlagPos findEmptyPosition [10, 50, "B_Quadbike_01_F"];
		
		if (count _quadPosition > 0) then {
			for "_q" from 1 to 4 step 1 do {
				_newQuad = "B_Quadbike_01_F" createVehicle _quadPosition;
				//_newQuad call { _nul = [ _newQuad, _vehicleDesertedDelay, _vehicleRespawnDelay ] spawn LVR_fnc_vehRespawn };
			};
		};
		
		// B_MRAP_01_hmg_F
		_hunterPosition = _fobFlagPos findEmptyPosition [12, 50, "B_MRAP_01_hmg_F"];
		
		if (count _hunterPosition > 0) then {
			for "_h" from 1 to 2 step 1 do {
				_newHunter = "B_MRAP_01_hmg_F" createVehicle _hunterPosition;
				//_newHunter call { _nul = [ _newHunter, _vehicleDesertedDelay, _vehicleRespawnDelay ] spawn LVR_fnc_vehRespawn };
			};
		};
		
		// B_Heli_Light_01_F
		_heliPosition = _fobFlagPos findEmptyPosition [50, 500, "B_Heli_Light_01_F"];
		
		if (count _heliPosition > 0) then {
			_newHeli = "B_Heli_Light_01_F" createVehicle _heliPosition;
			//_newHeli call { _nul = [ _newHeli, _vehicleDesertedDelay, _vehicleRespawnDelay ] spawn LVR_fnc_vehRespawn };
		};
		
		// B_Boat_Armed_01_minigun_F
		_findClosestSea = selectBestPlaces [_fobFlagPos, 500, "sea", 1, 1];
		_spot = _findClosestSea select 0;
		_spot2 = _spot select 0;
		
		if (count _findClosestSea > 0) then {
			if (surfaceIsWater _spot2) then {
				for "_b" from 1 to 1 step 1 do {
					_newBoat = "B_Boat_Armed_01_minigun_F" createVehicle _spot2;
					//_newBoat call { _nul = [ _newBoat, _vehicleDesertedDelay, _vehicleRespawnDelay ] spawn LVR_fnc_vehRespawn };
				};
				
				_mrkName = format["%1_vehDepot_ship", _fobName];
				_marker = createMarker [_mrkName, _spot2];
				_marker setMarkerType "b_naval";
				_marker setMarkerShape "ICON";
				_marker setMarkerSize [1, 1];
				_marker setMarkerColor "ColorWEST";
			};
		};
	};
};