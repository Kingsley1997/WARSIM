_casPos = _this select 0;
_unit = _this select 1;

_unitObj = [_unit] call BIS_fnc_getUnitByUid;
_name = format ["%1 (%2)", name _unitObj, (getText (configFile >> "CfgVehicles" >> (typeOf vehicle _unitObj) >> "displayName"))];
_mrkName = format ["WSGUICAS_LOC_%1", _name];

deleteMarkerLocal _mrkName;
_marker = createMarkerLocal [_mrkName, _casPos];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal "mil_destroy";
_marker setMarkerSizeLocal [1, 1];
_marker setMarkerColorLocal "ColorRed";

["TaskAssigned", ["", "New mission received, check your map!"]] call BIS_fnc_showNotification;

_unitObj setVariable ["WSGUICAS_LOC", _mrkName, true];

_index = _unitObj addAction ["<t color='#FF8800'>MARK CAS AS COMPLETE</t>", {
	deleteMarker ((_this select 0) getVariable ["WSGUICAS_LOC", ""]);
	(_this select 0) removeAction (_this select 2);
	(_this select 0) setVariable ["WSGUICAS_LOC_INDEX", 0, true];
}];

_unitObj setVariable ["WSGUICAS_LOC_INDEX", _index, true];