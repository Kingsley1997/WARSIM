private ["_unit", "_object"];

_unit = _this select 1;
_allObjects = attachedObjects _unit;

if (local _unit) then {
	{
		_aObj = _x;
		_class = typeOf _x;
		_strPos = (getPosASL _x) call fn_positionToString;
		[[_class, _strPos, (getDir _x), _x], "sfn_writeObject", false, false, true] call BIS_fnc_MP;
		_x setPos [((getPos _x) select 0), ((getPos _x) select 1), 0];
		
		detach _x;
		
		if (_class == "Flag_UK_F") then {
			_conf = ["Would you like to mark this area as an Observation Post?", "Confirmation", "Yes", "No"] call BIS_fnc_guiMessage;
			if (_conf) then {
				createDialog "WS_GUI_OP_Namer";
				_opPosStr = (getPos _aObj) call fn_positionToString;
				uiNamespace setVariable ["markOp_Pos", _opPosStr];
			};
		};
	} forEach _allObjects;
	
	_unit removeAction (_unit getVariable ["WS_BUILDER_RELEASE_Index", 0]);
	_unit removeAction (_unit getVariable ["WS_BUILDER_OPTIONS_Index", 0]);
	_unit removeAction (_unit getVariable ["WS_BUILDER_CANCEL_Index", 0]);
};