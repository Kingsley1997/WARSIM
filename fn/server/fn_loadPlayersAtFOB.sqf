if (!isServer || !isDedicated) exitWith {};

private ["_fobName","_result","_unit","_puid","_profileName","_unitFileName","_misOwner","_misPos"];

_fobName = _this;
_result = [];

{
	_unit = _x;
	_puid = getPlayerUID _unit;

	_profileName = _unit getVariable["profileName", ""];
	if (_profileName == "") exitWith {};

	_unitFileName = format["%1_%2", _puid, (_profileName call iniDB_CRC32)];

	_misOwner = ["missions", _unitFileName, "owner", "STRING"] call iniDB_read;
	_misPos = ["missions", _unitFileName, "position", "STRING"] call iniDB_read;

	if (_misPos == _fobName) then {
		_result pushBack _unit;
	};
} forEach playableUnits;

_result