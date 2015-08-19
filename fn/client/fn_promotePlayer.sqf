if (!isServer) exitWith {};

/*
	Author: Kingsley
	Description: Promotes the given player based on the given tour count. This is a persistence function.
	Parameter(s):
		0: OBJECT - Player to be promoted
		1: NUMBER - Numbers of tours completed
	Returns: STRING (returns new rank in capitals)
*/

_unit = _this select 0;
_tours = _this select 1;
_puid = getPlayerUID _unit;

_profileName = _unit getVariable["profileName", ""];
if (_profileName == "") exitWith {};
_unitFileName = format["%1_%2", _puid, (_profileName call iniDB_CRC32)];

_curRank = ["profiles", _unitFileName, "rank", "STRING"] call iniDB_read;
_newRank = _curRank;

switch (_tours) do {
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

if (_tours > 6) then {
	_newRank = "COLONEL";
	_unit setRank "COLONEL";
};

if (_curRank != _newRank) then {
	_unit call fn_savePlayer;
};

_newRank