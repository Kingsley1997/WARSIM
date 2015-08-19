/*
	Author: Kingsley
	Description: Creates a deployment for the given player
	Parameter(s): OBJECT - Player to be loaded
	Returns: BOOLEAN (returns true)
*/

["Started Request Deployment On Server", true] call fn_devLog;

_unit = _this;
_puid = getPlayerUID _unit;
_result = true;

_profileName = _unit getVariable["profileName", ""];
if (_profileName == "") exitWith {};
_unitFileName = format["%1_%2", _puid, (_profileName call iniDB_CRC32)];

// Check Current Deployment
_curDeploy = ["missions", _unitFileName, "owner", "STRING"] call iniDB_read;

if (_curDeploy == "") then {
	// Define FOB Markers
	_fobs = [];
	
	for "_i" from 1 to WS_CFG_maximumFobCount step 1 do {
		scopeName "fLoop";
		_fobName = format["fob%1", _i];
		if (getMarkerColor _fobName == "") then {
			breakOut "fLoop";
		} else {
			_fobs = _fobs + [ format["%1", _fobName] ];
		};
	};
	
	_randFob = _fobs select floor random count _fobs;

	// Load Profile Tour Count
	_tourCount = ["profiles", _unitFileName, "tourCount", "SCALAR"] call iniDB_read;
	_useTitle = format[ "Tour #%1", (_tourCount + 1) ];

	// Define Vars
	_description = "This is a combat deployment. You are operating at a forward operating base (FOB) somewhere in Altis. You will receive your assignments once there. Good luck!";
	_descriptionShort = format["Combat Deployment: %1", _useTitle];

	// Create Mission
	["missions", _unitFileName, "owner", _unitFileName] call iniDB_write;
	["missions", _unitFileName, "position", _randFob] call iniDB_write;
	["missions", _unitFileName, "title", _useTitle] call iniDB_write;
	["missions", _unitFileName, "description", _description] call iniDB_write;
	
	_unit setVariable["newDeployPos", _randFob, true];
};

_unit setVariable["reqDeployDone", true, true];

_result