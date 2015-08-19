/*
	Author: Kingsley
	Description: Loads a players deployment
	Parameter(s): OBJECT - Player to be loaded
	Returns: BOOLEAN (returns true)
*/

["Started Loading Deployment On Server", false] call fn_devLog;

_unit = _this select 0;
_fob = _this select 1;
_puid = getPlayerUID _unit;
_result = true;

_profileName = _unit getVariable["profileName", ""];
if (_profileName == "") exitWith {};

_unitFileName = format["%1_%2", _puid, (_profileName call iniDB_CRC32)];

["missions", _unitFileName] call iniDB_deletesection;

// Load Profile Tour Count
_tourCount = ["profiles", _unitFileName, "tourCount", "SCALAR"] call iniDB_read;
_useTitle = format[ "Tour #%1", (_tourCount + 1) ];

// Define Vars
_description = "This is a combat deployment. You are operating at a forward operating base (FOB) somewhere in Altis. You will receive your assignments once there. Good luck!";
_descriptionShort = format["Combat Deployment: %1", _useTitle];

// Create Mission
["missions", _unitFileName, "owner", _unitFileName] call iniDB_write;
["missions", _unitFileName, "position", _fob] call iniDB_write;
["missions", _unitFileName, "title", _useTitle] call iniDB_write;
["missions", _unitFileName, "description", _description] call iniDB_write;

["Created Deployment", false] call fn_devLog;

// FOB Transition TODO
// [_unit, _fob, (_tourCount + 1)] call fn_fobIntro;
[[_unit, _fob, (_tourCount + 1)], "fn_fobIntro", _unit, false, false] call BIS_fnc_MP;
// _unit setPos (getMarkerPos _fob);

[_unit, _fob] call fn_loadZones;

["Called fn_loadZones", false] call fn_devLog;