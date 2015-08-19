private ["_unit"];

_unit = player;

if (local _unit) then {
	_unit addAction [ "<t color='#FF8800' size='1.0'>WARSIM MENU</t>", { createDialog "WS_GUI_Menu"; } ];
};