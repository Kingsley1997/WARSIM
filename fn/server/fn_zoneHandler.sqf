/*
private ["_fob", "_continue", "_clearedList"];

_fob = _this;
_continue = true;
_clearedList = [];

scopeName "zHandlerMain";
["Inside zHandlerMain", false] call fn_devLog;

while { _continue } do {
	["Inside zHandlerMain While", false] call fn_devLog;
	_allComplete = true;
	
	for "_z" from 0 to 10 do {
		_mrkName = format["%1_aiZone_%2", _fob, _z];
		
		if ( !(_mrkName in _clearedList) ) then {
			["Marker Not In List", false] call fn_devLog;
			if (getMarkerColor _mrkName != "") then {
				["Marker Exists", false] call fn_devLog;
				_enemies = (getMarkerPos _mrkName) nearEntities ["Man", 500];
				
				_allDead = true;
				
				{
					if (side _x != east) then {
						_allDead = false;
					};
				} forEach _enemies;
				
				if (_allDead) then {
					["All Dead", false] call fn_devLog;
					_mrkName setMarkerColor "ColorWEST";
					["zones", _mrkName, "status", "2"] call iniDB_write;
					_clearedList pushBack _mrkName;
					breakTo "zHandlerCompCheck";
				};
			};
		};
	};
	
	sleep 5;
};

scopeName "zHandlerCompCheck";
["Inside zHandlerCompCheck", false] call fn_devLog;

_allComplete = true;

for "_z" from 0 to 10 do {
	_mrkName = format["%1_aiZone_%2", _fob, _z];
	
	if (getMarkerColor _mrkName == "") then {
		["Marker doesn't exist", false] call fn_devLog;
		// Marker doesn't exist, gone too far
		_continue = false;
		breakTo "zHandlerExit";
	} else {
		if (getMarkerColor _mrkName != "ColorWEST") then {
			["Marker is not WEST", false] call fn_devLog;
			_allComplete = false;
			breakTo "zHandlerMain";
		};
	};
};

scopeName "zHandlerExit";
["Inside zHandlerExit", false] call fn_devLog;

if (_allComplete) then {
	// Run complete tour code
	["All Complete - TOUR OVER", false] call fn_devLog;
} else {
	breakTo "zHandlerMain";
};
*/