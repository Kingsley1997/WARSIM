private ["_unit", "_mrkName", "_pos", "_radius"];

_unit = [_this, 0, player] call BIS_fnc_param;
_mrkName = [_this, 1, ""] call BIS_fnc_param;
_pos = [_this, 2, []] call BIS_fnc_param;
_radius = [_this, 3, 0] call BIS_fnc_param;
_color = [_this, 4, "ColorEAST"] call BIS_fnc_param;

if (local _unit) then {
	_marker = createMarkerLocal [_mrkName, _pos];
	_marker setMarkerShapeLocal "ELLIPSE";
	_marker setMarkerSizeLocal [_radius, _radius];
	_marker setMarkerColorLocal "ColorEAST";
	_marker setMarkerBrushLocal "Solid";
};