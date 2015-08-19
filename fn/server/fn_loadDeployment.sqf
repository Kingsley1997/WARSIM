/*
	Author: Kingsley
	Description: Loads a players deployment
	Parameter(s): OBJECT - Player to be loaded
	Returns: BOOLEAN (returns true)
*/

private ["_unit","_shouldCreate","_puid","_result","_grpLeader","_grpLeaderProfileName","_grpLeaderPuid","_grpLeaderFileName","_grpLeaderMissionCheck","_misOwner","_misPos","_misTitle","_misDescription","_profileName","_unitFileName","_checkOwner","_fobs","_i","_fobName","_randFob","_tourCount","_useTitle","_description","_descriptionShort"];

_unit = _this select 0;
_shouldCreate = _this select 1;
_puid = getPlayerUID _unit;
_result = true;

_grpLeader = leader group _unit;

if (_grpLeader != _unit) then {
	_grpLeaderProfileName = _grpLeader getVariable["profileName", ""];
	if (_grpLeaderProfileName != "") then {
		_grpLeaderPuid = getPlayerUID _grpLeader;
		_grpLeaderFileName = format["%1_%2", _grpLeaderPuid, (_grpLeaderProfileName call iniDB_CRC32)];
		_grpLeaderMissionCheck = ["missions", _grpLeaderFileName, "owner", "STRING"] call iniDB_read;
		if (_grpLeaderMissionCheck != "") then {
			_misOwner			= ["missions", _grpLeaderFileName, "owner", "STRING"] call iniDB_read;
			_misPos				= ["missions", _grpLeaderFileName, "position", "STRING"] call iniDB_read;
			_misTitle			= ["missions", _grpLeaderFileName, "title", "STRING"] call iniDB_read;
			_misDescription		= ["missions", _grpLeaderFileName, "description", "STRING"] call iniDB_read;
			
			_unit setVariable["isNewDeployment", false, true];
			_unit setVariable["isAlreadyOnDeployment", true, true];
			_unit setVariable["deploymentData", [
				_misOwner,
				_misPos,
				_misTitle,
				_misDescription
			], true];
			
			breakTo "endFile";
		};
	};
};

_profileName = _unit getVariable["profileName", ""];
if (_profileName == "") exitWith {};

_unitFileName = format["%1_%2", _puid, (_profileName call iniDB_CRC32)];

_checkOwner = ["missions", _unitFileName, "owner", "STRING"] call iniDB_read;

if (_checkOwner == "") then {
	// No deployment found
	if (_shouldCreate) then {
		_fobs = [];
		
		for "_i" from 0 to WS_CFG_maximumFobCount do {
			_fobName = format["fob%1", _i];
			if (getMarkerColor _fobName != "") then {
				_fobs pushBack _fobName;
			};
		};
		
		_randFob = _fobs select floor random count _fobs;

		// Load Profile Tour Count
		_tourCount = ["profiles", _unitFileName, "tourCount", "SCALAR"] call iniDB_read;
		_useTitle = format[ "Tour #%1", (_tourCount + 1) ];

		// Define Vars
		_description = "This is a combat deployment. You are operating at a forward operating base (FOB) somewhere in Altis. You will receive your assignments once there. Good luck!";
		_descriptionShort = format["Combat Deployment: %1", _useTitle];
		
		// Delete any old mission records for the given player
		["missions", _unitFileName] call iniDB_deletesection;

		// Create Mission
		["missions", _unitFileName, "owner", _unitFileName] call iniDB_write;
		["missions", _unitFileName, "position", _randFob] call iniDB_write;
		["missions", _unitFileName, "title", _useTitle] call iniDB_write;
		["missions", _unitFileName, "description", _description] call iniDB_write;
		
		["Created Deployment", false] call fn_devLog;
		
		[[_unit, _randFob, (_tourCount + 1)], "fn_fobIntro", _unit, false, false] call BIS_fnc_MP;
				
		[_unit, _randFob] call fn_loadZones;
		
		_unit setVariable["isNewDeployment", true, true];
		_unit setVariable["isAlreadyOnDeployment", false, true];
		
		_unit setVariable["deploymentData", [
			_unitFileName,
			_randFob,
			_useTitle,
			_description
		], true];
	} else {
		_unit setVariable["deploymentData", [], true];
	};
} else {
	_misOwner			= ["missions", _unitFileName, "owner", "STRING"] call iniDB_read;
	_misPos				= ["missions", _unitFileName, "position", "STRING"] call iniDB_read;
	_misTitle			= ["missions", _unitFileName, "title", "STRING"] call iniDB_read;
	_misDescription		= ["missions", _unitFileName, "description", "STRING"] call iniDB_read;
	
	[_unit, _misPos] call fn_loadZones;
	
	_unit setVariable["isNewDeployment", false, true];
	_unit setVariable["isAlreadyOnDeployment", false, true];
	
	_unit setVariable["deploymentData", [
		_misOwner,
		_misPos,
		_misTitle,
		_misDescription
	], true];
};

scopeName "endFile";

_unit setVariable["hasLoadedDeployment", true, true];

_result