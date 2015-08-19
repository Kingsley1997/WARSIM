private ["_class", "_pos", "_dir", "_exists", "_hash", "_obj"];

_class = _this select 0;
_pos = _this select 1;
_dir = _this select 2;
_obj = _this select 3;
_hash = call sfn_hashID;

_exists = ["objects", _hash, "class", "STRING"] call iniDB_read;

if (_exists == "") then {
	["objects", _hash, "class", _class] call iniDB_write;
	["objects", _hash, "pos", _pos] call iniDB_write;
	["objects", _hash, "dir", _dir] call iniDB_write;
	["objects", _hash, "hash", _hash] call iniDB_write;
	
	_header = ["objects", "HEAD", "hashArray", "ARRAY"] call iniDB_read;
	_header pushBack _hash;
	["objects", "HEAD", "hashArray", _header] call iniDB_write;
	
	_obj setVariable ["objHash", _hash, true];
};