private ["_unit", "_object"];

_unit = _this select 1;
_object = _this select 3 select 0;
_offset = _this select 3 select 1;
_allObjects = attachedObjects _unit;
_allow = true;

if (local _unit) then {
	if (count _allObjects == 0) then {
		if (_object == "Flag_UK_F") then {
			_nearFlags = [(getPos _unit), 500] call fn_closestOps;
			if (count _nearFlags > 0) then {
				_allow = false;
			};
		};
		
		if (_allow) then {
			_newObj = _object createVehicle position _unit;
			_newObj attachTo [_unit, _offset];
			_relIndex = _unit addAction ["<t color='#FF0000'>Release Object</t>", "builder\releaseObject.sqf"];
			_optIndex = _unit addAction ["<t color='#FF0000'>Object Options</t>", "builder\objectOptions.sqf"];
			_canIndex = _unit addAction ["<t color='#FF0000'>Cancel Object</t>", "builder\cancelObject.sqf"];
			_unit setVariable ["WS_BUILDER_RELEASE_Index", _relIndex, true];
			_unit setVariable ["WS_BUILDER_OPTIONS_Index", _optIndex, true];
			_unit setVariable ["WS_BUILDER_CANCEL_Index", _canIndex, true];
			
			if (_object != "Flag_UK_F") then {
				_newObj addAction ["<t color='#FF0000'>Delete Object</t>", "builder\deleteObject.sqf", [], 1.5, false, true, "(toLower (_this getVariable ['playerRole', 'DEFAULT'])) == 'repair'"];
			};
		} else {
			hint "There is already an observation post nearby!";
		};
	} else {
		hint "You're already holding an object";
	};
};