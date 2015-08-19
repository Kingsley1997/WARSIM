/*
	Author: Kingsley
	Description: Loads a players deployment. If no deployment is found, it will remind the player
	Parameter(s): OBJECT - Player to be loaded
	Returns: BOOLEAN (returns true)
*/

if (isServer || isDedicated) exitWith {};

["Started Loading Deployment", true] call fn_devLog;

private ["_unit","_shouldCreate","_isNew","_isAlreadyOnDeployment","_depData","_return"];

_unit = _this select 0;
_shouldCreate = _this select 1;

[[_unit, _shouldCreate], "sfn_loadDeployment", false, false, true] call BIS_fnc_MP;

waitUntil { _unit getVariable["hasLoadedDeployment", false] };

_isNew = _unit getVariable["isNewDeployment", false];
_isAlreadyOnDeployment = _unit getVariable["isAlreadyOnDeployment", false];
_depData = _unit getVariable["deploymentData", []];

if (_isAlreadyOnDeployment) then {
	_return = ["Your group leader is on a deployment. Would you like to join them?", "Confirmation", "Yes", "No"] call BIS_fnc_guiMessage;
	if (_return) then {
		// Add the same mission to their profile and spawn them
		[[_unit, (_depData select 1)], "sfn_createSpecificDeployment", false, false, true] call BIS_fnc_MP;
	};
} else {
	if (_isNew) then {
		{
			if (_x != _unit) then {
				_return = ["Your group leader has started a deployment. Would you like to join them?", "Confirmation", "Yes", "No"] call BIS_fnc_guiMessage;
				if (_return) then {
					// Add the same mission to their profile and spawn them
					[[_x, (_depData select 1)], "sfn_createSpecificDeployment", false, false, true] call BIS_fnc_MP;
				};
			};
		} forEach units group _unit;
	};
};