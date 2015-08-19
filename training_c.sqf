{
	if (isPlayer _x && local _x) then {
		_arrow = objNull;
		_trObj = objNull;
		_rank = rank _x;
		
		switch ( toUpper _rank ) do {
			case "PRIVATE": { _trObj = trPvt };
			case "CORPORAL": { _trObj = trCpl };
			case "SERGEANT": { _trObj = trSgt };
			case "LIEUTENANT": { _trObj = trLt };
			case "CAPTAIN": { _trObj = trCpt };
			case "MAJOR": { _trObj = trMaj };
			case "COLONEL": { _trObj = trCol };
		};

		_arrow = "Sign_Arrow_Blue_F" createVehicleLocal getPos _trObj;
		_arrow setPosATL (_arrow modelToWorld [-1.5, -1, 2.25]);
		
		_x setVariable ["Training_Arrow", _arrow, true];
	};
} forEach allUnits;