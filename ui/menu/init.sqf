private ["_display","_unit","_idc","_ctrl"];

disableSerialization;

_display = _this select 0 select 0;
_unit = player;
_idc = -1;
_ctrl = _display displayCtrl _idc;

if (local _unit) then {
	_role = _unit getVariable ["playerRole", "repair"];
	
	_baseDistance = (position _unit) distance (getMarkerPos "center_base");
	if ( _baseDistance < 2000 ) then {
		_bbBtn = _display displayCtrl 1605;
		_bbBtn ctrlEnable false;
	};
	
	if ( (toLower _role) != "repair" ) then {
		_bbBtn = _display displayCtrl 1605;
		_bbBtn ctrlEnable false;
	};
	
	if (leader group _unit != _unit) then {
		_rpBtn = _display displayCtrl 1600;
		_rpBtn ctrlEnable false;
	};
};