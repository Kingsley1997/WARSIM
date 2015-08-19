if (!isServer || !isDedicated) exitWith {};

private ["_objectsInDB"];

_objectsInDB = ["objects", "HEAD", "hashArray", "ARRAY"] call iniDB_read;
_basesInDB = ["bases", "HEAD", "intArr", "ARRAY"] call iniDB_read;

{
	_hash = _x;
	
	_class = ["objects", _hash, "class", "STRING"] call iniDB_read;
	_pos = ["objects", _hash, "pos", "STRING"] call iniDB_read;
	_dir = ["objects", _hash, "dir", "SCALAR"] call iniDB_read;
	_hash = ["objects", _hash, "hash", "STRING"] call iniDB_read;
	
	_newObj = _class createVehicle (call compile _pos);
	_newObj setDir _dir;
	_newObj setVariable ["objHash", _hash, true];
	
	[_newObj, "fn_addObjectAction", true, true, true] call BIS_fnc_MP;
} forEach _objectsInDB;

{
	_title = ["bases", _x, "title", "STRING"] call iniDB_read;
	_pos = ["bases", _x, "pos", "STRING"] call iniDB_read;
	
	_marker = createMarker [_x, (call compile _pos)];
	_marker setMarkerShape "ICON";
	_marker setMarkerSize [0.75, 0.75];
	_marker setMarkerColor "ColorWEST";
	_marker setMarkerType "mil_box";
	_marker setMarkerText _title;
} forEach _basesInDB;