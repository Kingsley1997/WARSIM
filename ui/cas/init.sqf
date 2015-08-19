private ["_display","_unit","_idc","_ctrl","_listBox","_name","_index"];

disableSerialization;

_display = _this select 0;
_unit = player;
_idc = -1;
_ctrl = _display displayCtrl _idc;

_listBox = _display displayCtrl 1500;

lbClear _listBox;

{
	if (typeOf vehicle _x in WS_CFG_airVehicles) then {
		_name = getText (configFile >> "CfgVehicles" >> (typeOf vehicle _x) >> "displayName");
		_index = _listBox lbAdd ( format ["%1 (%2)", name _x, _name] );
		_listBox lbSetData [_index, (getPlayerUID _x)];
	};
} forEach allUnits;