private ["_unit", "_puid", "_profileName", "_unitFileName", "_curRank", "_tourCount", "_newRank"];

_unit = _this;
_puid = getPlayerUID _unit;
_newRank = "PRIVATE";
_profileName = _unit getVariable["profileName", ""];
if (_profileName == "") exitWith {};
_unitFileName = format["%1_%2", _puid, (_profileName call iniDB_CRC32)];

_curRank = ["profiles", _unitFileName, "rank", "STRING"] call iniDB_read;
_tourCount = ["profiles", _unitFileName, "tourCount", "SCALAR"] call iniDB_read;

switch (_tourCount) do {
	case 0: {
		_newRank = "PRIVATE";
		_unit setRank "PRIVATE";
	};
	case 1: {
		_newRank = "CORPORAL";
		_unit setRank "CORPORAL";
	};
	case 2: {
		_newRank = "SERGEANT";
		_unit setRank "SERGEANT";
	};
	case 3: {
		_newRank = "LIEUTENANT";
		_unit setRank "LIEUTENANT";
	};
	case 4: {
		_newRank = "CAPTAIN";
		_unit setRank "CAPTAIN";
	};
	case 5: {
		_newRank = "MAJOR";
		_unit setRank "MAJOR";
	};
	case 6: {
		_newRank = "COLONEL";
		_unit setRank "COLONEL";
	};
};

if (_tourCount > 6) then {
	_newRank = "COLONEL";
	_unit setRank "COLONEL";
};

_unit setVariable ["playerRank", _newRank, true];

if (_newRank != _curRank) then {
	["profiles", _unitFileName, "rank", _newRank] call iniDB_write;
	
	[[_unit, _newRank], "fn_promotedScreen", _unit, false, false] call BIS_fnc_MP;
};