private ["_obj", "_hash"];

_obj = _this;
_hash = _obj getVariable ["objHash", ""];

["objects", _hash] call iniDB_deletesection;

_objectsInDB = ["objects", "HEAD", "hashArray", "ARRAY"] call iniDB_read;
_newObjArr = _objectsInDB;

{
	_h = _x;
	
	if (_h == _hash) then {
		_newObjArr = _newObjArr - [_h];
	};
} forEach _objectsInDB;

["objects", "HEAD", "hashArray", _newObjArr] call iniDB_write;

deleteVehicle _obj;