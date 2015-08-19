/*
    GrenadeStop v0.8 for ArmA 3 Alpha by Bake (tweaked slightly by Rarek)
    
    DESCRIPTION:
    Stops players from throwing grenades in safety zones.
    
    INSTALLATION:
    Move grenadeStop.sqf to your mission's folder. Then add the
    following line to your init.sqf file (create one if necessary):
    execVM "grenadeStop.sqf";
    
    CONFIGURATION:
    Edit the #defines below.
*/

WS_CFG_SAFETY_ZONES = [["center_base", 1500]];
WS_CFG_SAFETY_MESSAGE = "You cannot fire in a protected zone.";

if (isDedicated) exitWith {};
waitUntil {!isNull player};

player addEventHandler ["Fired", {
    if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count WS_CFG_SAFETY_ZONES > 0) then {
        deleteVehicle (_this select 6);
		if (local (_this select 0)) then {
			hint WS_CFG_SAFETY_MESSAGE;
		};
    };
}];

_air = (getMarkerPos "center_base") nearEntities [WS_CFG_airVehicles, 1500];

if (count _air > 0) then {
	{
		_x addEventHandler ["Fired", {
			if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count WS_CFG_SAFETY_ZONES > 0) then {
				deleteVehicle (_this select 6);
				if (local (_this select 0)) then {
					hint WS_CFG_SAFETY_MESSAGE;
				};
			};
		}];
	} forEach _air;
};

_armor = (getMarkerPos "center_base") nearEntities [WS_CFG_armorVehicles, 1500];

if (count _armor > 0) then {
	{
		_x addEventHandler ["Fired", {
			if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count WS_CFG_SAFETY_ZONES > 0) then {
				deleteVehicle (_this select 6);
				if (local (_this select 0)) then {
					hint WS_CFG_SAFETY_MESSAGE;
				};
			};
		}];
	} forEach _armor;
};
