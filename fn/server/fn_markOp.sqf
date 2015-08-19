private ["_text", "_pos", "_latestInt", "_latest", "_marker"];

_text = _this select 0;
_pos = _this select 1;

_latest = ["bases", "HEAD", "maxInt", "SCALAR"] call iniDB_read;
_collection = ["bases", "HEAD", "intArr", "ARRAY"] call iniDB_read;

if (_latest <= 0) then {
	["bases", "HEAD", "maxInt", (WS_CFG_startingFobCount + 1)] call iniDB_write;
	_latestInt = (WS_CFG_startingFobCount + 1);
} else {
	_latestInt = _latest + 1;
};

["bases", (format ["fob%1", _latestInt]), "title", (format ["OP %1", (toUpper _text)])] call iniDB_write;
["bases", (format ["fob%1", _latestInt]), "pos", _pos] call iniDB_write;

_collection pushBack (format ["fob%1", _latestInt]);
["bases", "HEAD", "intArr", _collection] call iniDB_write;
["bases", "HEAD", "maxInt", _latestInt] call iniDB_write;

_marker = createMarker [(format ["fob%1", _latestInt]), (call compile _pos)];
_marker setMarkerShape "ICON";
_marker setMarkerSize [0.75, 0.75];
_marker setMarkerColor "ColorWEST";
_marker setMarkerType "mil_box";
_marker setMarkerText (format ["OP %1", (toUpper _text)]);