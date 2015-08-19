private ["_unit"];

["Started Request Deployment", true] call fn_devLog;

_unit = _this;

[_unit, "sfn_requestDeployment", false, false, true] call BIS_fnc_MP;

waitUntil { _unit getVariable["reqDeployDone", false] };

_newFob = _unit getVariable["newDeployPos", ""];

if (_newFob != "") then {
	// Transition to FOB
	_unit setPos (getMarkerPos _newFob);
};

_unit call fn_loadDeployment;