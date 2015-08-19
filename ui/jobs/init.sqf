private ["_display","_unit","_idc","_ctrl","_playerRank","_playerRole","_left1_img","_left1_text","_left1_btn","_left2_img","_left2_text","_left2_btn","_right1_img","_right1_text","_right1_btn","_right2_img","_right2_text","_right2_btn"];

disableSerialization;

_display = _this select 0;
_unit = player;
_idc = -1;
_ctrl = _display displayCtrl _idc;

_playerRank = _unit getVariable["playerRank", ""];
_playerRole = _unit getVariable["playerRole", ""];

if (_playerRank != "" && _playerRole != "") then {
	// Medic
	_left1_img = _display displayCtrl 1200;
	_left1_text = _display displayCtrl 1100;
	_left1_btn = _display displayCtrl 1600;
	_left1_text ctrlSetStructuredText parseText "<t align='center' size='1.25'>Medic</t><br /><t align='left' size='0.75'>- HEAL TO 100%<br />- 200% FASTER REVIVE<br />- GREAT RESPONSIBILITY</t>";
	_left1_btn ctrlSetText "CHOOSE ROLE";
	_left1_btn buttonSetAction "closeDialog 0; [player, 'medic'] execVM 'ui\jobs\fn_switchUnit.sqf'";
	
	if (toLower _playerRole == "medic") then {
		_left1_btn ctrlSetText "RESIGN";
		_left1_btn buttonSetAction "closeDialog 0; [player] execVM 'ui\jobs\fn_resign.sqf'";
	};

	// Repair
	_left2_img = _display displayCtrl 1201;
	_left2_text = _display displayCtrl 1101;
	_left2_btn = _display displayCtrl 1601;
	_left2_text ctrlSetStructuredText parseText "<t align='center' size='1.25'>Repair</t><br /><t align='left' size='0.75'>- REPAIR VEHICLES<br />- BUILD BASES<br />- CREATE OPs</t>";
	_left2_btn ctrlSetText "CHOOSE ROLE";
	_left2_btn buttonSetAction "closeDialog 0; [player, 'repair'] execVM 'ui\jobs\fn_switchUnit.sqf'";
	
	if (toLower _playerRole == "repair") then {
		_left2_btn ctrlSetText "RESIGN";
		_left2_btn buttonSetAction "closeDialog 0; [player] execVM 'ui\jobs\fn_resign.sqf'";
	};

	// Pilot
	_right2_img = _display displayCtrl 1202;
	_right2_text = _display displayCtrl 1102;
	_right2_btn = _display displayCtrl 1602;
	_right2_text ctrlSetStructuredText parseText "<t align='center' size='1.25'>Pilot</t><br /><t align='left' size='0.75'>- PILOT ALL AIRCRAFTS<br />- PROVIDE CAS<br />- CONTROL UAV DRONES</t>";
	_right2_btn ctrlSetText "CHOOSE ROLE";
	_right2_btn buttonSetAction "closeDialog 0; [player, 'pilot'] execVM 'ui\jobs\fn_switchUnit.sqf'";
	
	if (toLower _playerRole == "pilot") then {
		_right2_btn ctrlSetText "RESIGN";
		_right2_btn buttonSetAction "closeDialog 0; [player] execVM 'ui\jobs\fn_resign.sqf'";
	};

	// Sniper
	_right1_img = _display displayCtrl 1203;
	_right1_text = _display displayCtrl 1103;
	_right1_btn = _display displayCtrl 1603;
	_right1_text ctrlSetStructuredText parseText "<t align='center' size='1.25'>Sniper</t><br /><t align='left' size='0.75'>- LONG RANGED<br />- PROVIDE RECON<br />- CAMOUFLAGED</t>";
	_right1_btn ctrlSetText "CHOOSE ROLE";
	_right1_btn buttonSetAction "closeDialog 0; [player, 'sniper'] execVM 'ui\jobs\fn_switchUnit.sqf'";
	
	if (toLower _playerRole == "sniper") then {
		_right1_btn ctrlSetText "RESIGN";
		_right1_btn buttonSetAction "closeDialog 0; [player] execVM 'ui\jobs\fn_resign.sqf'";
	};
	
	switch ( toUpper _playerRank ) do {
		case "PRIVATE": {
			_left1_btn ctrlEnable true;
			_left2_btn ctrlEnable false;
			_right1_btn ctrlEnable false;
			_right2_btn ctrlEnable false;
		};
		case "CORPORAL": {
			_left1_btn ctrlEnable true;
			_left2_btn ctrlEnable true;
			_right1_btn ctrlEnable false;
			_right2_btn ctrlEnable false;
		};
		case "SERGEANT": {
			_left1_btn ctrlEnable true;
			_left2_btn ctrlEnable true;
			_right2_btn ctrlEnable true;
			_right1_btn ctrlEnable false;
		};
		case "LIEUTENANT": {
			_left1_btn ctrlEnable true;
			_left2_btn ctrlEnable true;
			_right1_btn ctrlEnable true;
			_right2_btn ctrlEnable true;
		};
	};
};