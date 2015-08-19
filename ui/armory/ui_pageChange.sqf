private ["_control", "_index", "_unit"];

_control = _this select 0;
_index = _this select 1;
_unit = player;

_playerRole = _unit getVariable["playerRole", ""];

with uiNamespace do {
	if (_playerRole != "") then {
		switch (_index) do {
			case 0: {
				// Loadouts
				{
					_picture = _x select 0;
					_text = _x select 1;
					_button = _x select 2;
					_class = _x select 3;
					_name = _x select 4;
					_classNamePic = (getText (configFile >> 'CfgWeapons' >> _class >> 'picture'));
					_ctrlStrText = WS_GUI_Armory_Display displayCtrl _text;
					_ctrlPicture = WS_GUI_Armory_Display displayCtrl _picture;
					_ctrlButton = WS_GUI_Armory_Display displayCtrl _button;
					
					switch ( toUpper _playerRole ) do {
						case "DEFAULT": {
							switch (_name) do {
								case "Rifleman":		{ _ctrlButton ctrlEnable true; };
								case "Medic":			{ _ctrlButton ctrlEnable false; };
								case "Engineer":		{ _ctrlButton ctrlEnable false; };
								case "Marksman":		{ _ctrlButton ctrlEnable true; };
								case "Machinegunner":	{ _ctrlButton ctrlEnable true; };
								case "Pilot":			{ _ctrlButton ctrlEnable false; };
								case "Sniper (.338)":	{ _ctrlButton ctrlEnable false; };
								case "Sniper (.408)":	{ _ctrlButton ctrlEnable false; };
							};
						};
						case "MEDIC": {
							switch (_name) do {
								case "Rifleman":		{ _ctrlButton ctrlEnable true; };
								case "Medic":			{ _ctrlButton ctrlEnable true; };
								case "Engineer":		{ _ctrlButton ctrlEnable false; };
								case "Marksman":		{ _ctrlButton ctrlEnable true; };
								case "Machinegunner":	{ _ctrlButton ctrlEnable true; };
								case "Pilot":			{ _ctrlButton ctrlEnable false; };
								case "Sniper (.338)":	{ _ctrlButton ctrlEnable false; };
								case "Sniper (.408)":	{ _ctrlButton ctrlEnable false; };
							};
						};
						case "REPAIR": {
							switch (_name) do {
								case "Rifleman":		{ _ctrlButton ctrlEnable true; };
								case "Medic":			{ _ctrlButton ctrlEnable false; };
								case "Engineer":		{ _ctrlButton ctrlEnable true; };
								case "Marksman":		{ _ctrlButton ctrlEnable true; };
								case "Machinegunner":	{ _ctrlButton ctrlEnable true; };
								case "Pilot":			{ _ctrlButton ctrlEnable false; };
								case "Sniper (.338)":	{ _ctrlButton ctrlEnable false; };
								case "Sniper (.408)":	{ _ctrlButton ctrlEnable false; };
							};
						};
						case "PILOT": {
							switch (_name) do {
								case "Rifleman":		{ _ctrlButton ctrlEnable true; };
								case "Medic":			{ _ctrlButton ctrlEnable false; };
								case "Engineer":		{ _ctrlButton ctrlEnable false; };
								case "Marksman":		{ _ctrlButton ctrlEnable true; };
								case "Machinegunner":	{ _ctrlButton ctrlEnable true; };
								case "Pilot":			{ _ctrlButton ctrlEnable true; };
								case "Sniper (.338)":	{ _ctrlButton ctrlEnable false; };
								case "Sniper (.408)":	{ _ctrlButton ctrlEnable false; };
							};
						};
						case "SNIPER": {
							switch (_name) do {
								case "Rifleman":		{ _ctrlButton ctrlEnable true; };
								case "Medic":			{ _ctrlButton ctrlEnable false; };
								case "Engineer":		{ _ctrlButton ctrlEnable false; };
								case "Marksman":		{ _ctrlButton ctrlEnable true; };
								case "Machinegunner":	{ _ctrlButton ctrlEnable true; };
								case "Pilot":			{ _ctrlButton ctrlEnable false; };
								case "Sniper (.338)":	{ _ctrlButton ctrlEnable true; };
								case "Sniper (.408)":	{ _ctrlButton ctrlEnable true; };
							};
						};
					};
					
					_ctrlStrText ctrlSetStructuredText parseText format ["<t align='center'>%1</t>", _name];
					_ctrlPicture ctrlSetText _classNamePic;
					_ctrlButton ctrlSetText "Select Kit";
					_ctrlButton buttonSetAction (format ["'%1' call ui_selectItem;", _name]);
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
			case 1: {
				// Attachments
				{
					_picture = _x select 0;
					_text = _x select 1;
					_button = _x select 2;
					_class = _x select 3;
					_name = _x select 4;
					_classNamePic = (getText (configFile >> 'CfgWeapons' >> _class >> 'picture'));
					_ctrlStrText = WS_GUI_Armory_Display displayCtrl _text;
					_ctrlPicture = WS_GUI_Armory_Display displayCtrl _picture;
					_ctrlButton = WS_GUI_Armory_Display displayCtrl _button;
					
					_ctrlButton ctrlEnable true;
					_ctrlButton ctrlShow true;
					
					_ctrlStrText ctrlSetStructuredText parseText format ["<t align='center'>%1</t>", _name];
					_ctrlPicture ctrlSetText _classNamePic;
					_ctrlButton ctrlSetText "Select Item";
					_ctrlButton buttonSetAction (format ["'%1' call ui_selectAttachment;", _class]);
					
					if (count (toArray _class) == 0) then {
						_ctrlButton ctrlEnable false;
						_ctrlButton ctrlShow false;
					};
				} forEach [
					// [picture, text, button]
					[1200,1100,1601,"optic_Hamr","RCO"],
					[1202,1102,1603,"optic_MRCO","MRCO"],
					[1204,1104,1605,"optic_Arco","ARCO"],
					[1206,1106,1607,"optic_Aco","ACO"],
					[1201,1101,1602,"optic_Holosight","MK17 Holosight"],
					[1203,1103,1604,"acc_flashlight","Flashlight"],
					[1205,1105,1606,"acc_pointer_IR","IR Laser Pointer"],
					[1207,1107,1608,"optic_NVS","NVS"]
				];
			};
		};
	};
};


