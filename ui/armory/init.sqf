private ["_display","_unit","_idc","_ctrl"];

disableSerialization;

_display = _this select 0;
_unit = player;
_idc = -1;
_ctrl = _display displayCtrl _idc;

uiNamespace setVariable ["WS_GUI_Armory_Display", _display];

_playerRole = _unit getVariable["playerRole", ""];

if (_playerRole != "") then {
	// Controls
	_pageSel = _display displayCtrl 1500;

	// 0
	_index = _pageSel lbAdd "Loadouts";
	_pageSel lbSetData [_index, "loadouts"];
	_pageSel lbSetCurSel _index;

	// 1
	_index = _pageSel lbAdd "Attachments";
	_pageSel lbSetData [_index, "attachments"];
	
	{
		_button = _x select 2;
		_name = _x select 4;
		_ctrlBtn = _display displayCtrl _button;
		
		switch ( toUpper _playerRole ) do {
			case "DEFAULT": {
				switch (_name) do {
					case "Rifleman":		{ _ctrlBtn ctrlEnable true; };
					case "Medic":			{ _ctrlBtn ctrlEnable false; };
					case "Engineer":		{ _ctrlBtn ctrlEnable false; };
					case "Marksman":		{ _ctrlBtn ctrlEnable true; };
					case "Machinegunner":	{ _ctrlBtn ctrlEnable true; };
					case "Pilot":			{ _ctrlBtn ctrlEnable false; };
					case "Sniper (.338)":	{ _ctrlBtn ctrlEnable false; };
					case "Sniper (.408)":	{ _ctrlBtn ctrlEnable false; };
				};
			};
			case "MEDIC": {
				switch (_name) do {
					case "Rifleman":		{ _ctrlBtn ctrlEnable true; };
					case "Medic":			{ _ctrlBtn ctrlEnable true; };
					case "Engineer":		{ _ctrlBtn ctrlEnable false; };
					case "Marksman":		{ _ctrlBtn ctrlEnable true; };
					case "Machinegunner":	{ _ctrlBtn ctrlEnable true; };
					case "Pilot":			{ _ctrlBtn ctrlEnable false; };
					case "Sniper (.338)":	{ _ctrlBtn ctrlEnable false; };
					case "Sniper (.408)":	{ _ctrlBtn ctrlEnable false; };
				};
			};
			case "REPAIR": {
				switch (_name) do {
					case "Rifleman":		{ _ctrlBtn ctrlEnable true; };
					case "Medic":			{ _ctrlBtn ctrlEnable false; };
					case "Engineer":		{ _ctrlBtn ctrlEnable true; };
					case "Marksman":		{ _ctrlBtn ctrlEnable true; };
					case "Machinegunner":	{ _ctrlBtn ctrlEnable true; };
					case "Pilot":			{ _ctrlBtn ctrlEnable false; };
					case "Sniper (.338)":	{ _ctrlBtn ctrlEnable false; };
					case "Sniper (.408)":	{ _ctrlBtn ctrlEnable false; };
				};
			};
			case "PILOT": {
				switch (_name) do {
					case "Rifleman":		{ _ctrlBtn ctrlEnable true; };
					case "Medic":			{ _ctrlBtn ctrlEnable false; };
					case "Engineer":		{ _ctrlBtn ctrlEnable false; };
					case "Marksman":		{ _ctrlBtn ctrlEnable true; };
					case "Machinegunner":	{ _ctrlBtn ctrlEnable true; };
					case "Pilot":			{ _ctrlBtn ctrlEnable true; };
					case "Sniper (.338)":	{ _ctrlBtn ctrlEnable false; };
					case "Sniper (.408)":	{ _ctrlBtn ctrlEnable false; };
				};
			};
			case "SNIPER": {
				switch (_name) do {
					case "Rifleman":		{ _ctrlBtn ctrlEnable true; };
					case "Medic":			{ _ctrlBtn ctrlEnable false; };
					case "Engineer":		{ _ctrlBtn ctrlEnable false; };
					case "Marksman":		{ _ctrlBtn ctrlEnable true; };
					case "Machinegunner":	{ _ctrlBtn ctrlEnable true; };
					case "Pilot":			{ _ctrlBtn ctrlEnable false; };
					case "Sniper (.338)":	{ _ctrlBtn ctrlEnable true; };
					case "Sniper (.408)":	{ _ctrlBtn ctrlEnable true; };
				};
			};
		};
	} forEach [
		// [picture, text, button]
		[1200,1100,1601,"arifle_MX_Black_Hamr_pointer_F","Rifleman"],
		[1202,1102,1603,"arifle_MX_GL_Black_Hamr_pointer_F","Medic"],
		[1204,1104,1605,"arifle_MX_Black_Hamr_pointer_F","Engineer"],
		[1206,1106,1607,"srifle_EBR_SOS_F","Marksman"],
		[1201,1101,1602,"MMG_02_sand_F","Machinegunner"],
		[1203,1103,1604,"arifle_MXC_Black_F","Pilot"],
		[1205,1105,1606,"srifle_DMR_02_sniper_F","Sniper (.338)"],
		[1207,1107,1608,"srifle_LRR_F","Sniper (.408)"]
	];
};