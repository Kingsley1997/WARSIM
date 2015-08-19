private ["_closestOps", "_mrkName"];

_closestOps = [];

for "_i" from WS_CFG_startingFobCount to WS_CFG_maximumFobCount do {
	_mrkName = format ["fob%1", _i];
	if (getMarkerColor _mrkName != "") then {
		if ( ((getMarkerPos _mrkName) distance (_this select 0)) <= (_this select 1) ) then {
			_closestOps pushBack (getMarkerPos _mrkName);
		};
	};
};

_closestOps