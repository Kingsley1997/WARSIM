private ["_unit", "_class"];

_unit = _this select 0;
_class = _this select 1;
_loadout = [_unit] call fn_getLoadout;

if (local _unit) then {
	[[_unit, _loadout], "sfn_loadPlayer", false, false, true] call BIS_fnc_MP;

	waitUntil { _unit getVariable["hasLoaded", false] };

	_hasLoaded = _unit getVariable["hasLoaded", false];
	_playerData = _unit getVariable["playerData", []];
	
	if (count _playerData > 0 && _hasLoaded) then {
		_plRank = toUpper (_playerData select 2);
		_reqRank = ["PRIVATE"];
		_useClass = "Rifleman";
		
		switch ( toUpper _class ) do {
			case "MEDIC":	{ _useClass = "Medic";			_reqRank = ["PRIVATE","CORPORAL","SERGEANT","LIEUTENANT","CAPTAIN","MAJOR","COLONEL"]; };
			case "REPAIR":	{ _useClass = "Engineer";		_reqRank = ["CORPORAL","SERGEANT","LIEUTENANT","CAPTAIN","MAJOR","COLONEL"]; };
			case "PILOT":	{ _useClass = "Pilot";			_reqRank = ["SERGEANT","LIEUTENANT","CAPTAIN","MAJOR","COLONEL"]; };
			case "SNIPER":	{ _useClass = "Sniper (.338)";	_reqRank = ["LIEUTENANT","CAPTAIN","MAJOR","COLONEL"]; };
		};
		
		//if (_plRank in _reqRank) then {
			// Player is eligable
			closeDialog 0; // Close jobs dialog
			_conf = ["Are you sure you want to change to this role? Your loadout will change to your selected role.", "Confirmation", "Yes", "No"] call BIS_fnc_guiMessage;
			
			if (_conf) then {
				[[_unit, _class], "sfn_setPlayerRole", false, false, true] call BIS_fnc_MP;
				_unit setVariable ["playerRole", _class, true];
				_useClass call ui_selectItem;
				if ( toUpper _class == "PILOT" ) then {
					[format ["You are now a %1. You now have access to all aircrafts. You'll be able to receive CAS missions when you're inside an aircraft.", _class], "Notice"] call BIS_fnc_guiMessage;
				} else {
					[format ["You are now a %1. Go to the arsenal to check out what hardware has opened up for you.", _class], "Notice"] call BIS_fnc_guiMessage;
				};
			};
		//} else {
			//["You haven't unlocked this role yet.", "Notice"] call BIS_fnc_guiMessage;
		//};
	};
};