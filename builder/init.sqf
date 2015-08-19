private ["_unit"];

_unit = _this select 0;

_unit addAction ["<t color='#FF0000' size='1.0'>Exit Builder</t>", {
	removeAllActions (_this select 1);
	(_this select 1) addAction [ "<t color='#FF8800' size='1.0'>WARSIM MENU</t>", { createDialog "WS_GUI_Menu"; } ];
}];

{
	_objName = (getText (configFile >> 'CfgVehicles' >> (_x select 0) >> 'displayName'));
	if ((_x select 0) == "Flag_UK_F") then {
		_unit addAction ["<t color='#FF8800'>Mark As Observation Post</t>", "builder\spawnObject.sqf", _x, 1.5, false, true, "count ([(getPos _this), 500] call fn_closestOps) == 0"];
	} else {
		_unit addAction [ format ["<t color='#FF8800'>%1</t>", _objName], "builder\spawnObject.sqf", _x ];
	};
} forEach [
	["Land_HBarrier_5_F", [0,3,1]],
	["Land_HBarrierTower_F", [0,10,2]],
	["Land_HBarrierWall4_F", [0,4,1]],
	["Land_Razorwire_F", [0,3,1]],
	["CamoNet_BLUFOR_F", [0,10,1.5]],
	["CamoNet_BLUFOR_big_F", [0,10,2]],
	["Flag_UK_F", [0,1,4]]
];