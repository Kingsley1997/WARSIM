private ["_display","_unit","_idc","_ctrl","_listBox","_name","_index"];

disableSerialization;

_display = _this select 0;
_unit = player;
_idc = -1;
_ctrl = _display displayCtrl _idc;

_listBox = _display displayCtrl 1500;

lbClear _listBox;

{
	_index = _listBox lbAdd (_x select 0);
	_listBox lbSetData [_index, (_x select 1)];
} forEach [
	["Ammunition", "B_Slingload_01_Ammo_F"],
	["Fuel Station", "B_Slingload_01_Fuel_F"],
	["Repair Station", "B_Slingload_01_Repair_F"],
	["Medical Supplies", "B_Slingload_01_Medevac_F"]
];