private ["_strToShow", "_shouldLocal", "_isDevEnabled"];

_strToShow = [_this, 0, ""] call BIS_fnc_param;
_shouldLocal = [_this, 1, true] call BIS_fnc_param;
_useConsole = [_this, 2, true] call BIS_fnc_param;
_isDevEnabled = WS_CFG_showDebug;

if (_isDevEnabled) then {
	if (_useConsole) then {
		"debug_console" callExtension ( (str _strToShow) + "#0100" );
	} else {
		if (_shouldLocal) then {
			if (local player) then {
				systemChat _strToShow;
			};
		} else {
			[
				[
					[_strToShow],
					{
						systemChat str _this select 0;
					}
				],
				"BIS_fnc_call",
				true,  
				false,
				true
			] call BIS_fnc_MP;
		};
	};
};