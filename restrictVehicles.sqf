_this spawn {
	_air = WS_CFG_airVehicles;
	_armor = WS_CFG_armorVehicles;

	rv_msg = {
		if (local _this) then {
			hint "You are not authorized to use this vehicle.";
		};
	};
	
	while { true } do {
		_unit = player;
		_unitRole = toUpper (_unit getVariable ["playerRole", ""]);
		
		if (_unitRole != "") then {
			if (driver vehicle _unit == _unit) then {
				if (typeOf vehicle _unit in _air && _unitRole != "PILOT") then {
					moveOut _unit;
					_unit call rv_msg;
				};
			};
			
			if (gunner vehicle _unit == _unit) then {
				if (typeOf vehicle _unit in _air && _unitRole != "PILOT") then {
					moveOut _unit;
					_unit call rv_msg;
				} else {
					if (typeOf vehicle _unit in _armor && _unitRole != "REPAIR") then {
						moveOut _unit;
						_unit call rv_msg;
					};
				};
			};
			
			if (commander vehicle _unit == _unit) then {
				if (typeOf vehicle _unit in _armor && _unitRole != "REPAIR") then {
					moveOut _unit;
					_unit call rv_msg;
				};
			};
		};
		
		sleep 1;
	};
};