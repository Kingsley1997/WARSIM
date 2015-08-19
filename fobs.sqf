if (!isServer || !isDedicated) exitWith {};

for "_f" from 0 to WS_CFG_startingFobCount step 1 do {
	_mrk = format ["fob%1", _f];
	if (getMarkerColor _mrk != "") then {
		_fobFlag = "Flag_UK_F" createVehicle (getMarkerPos _mrk);
		_fobFlag allowDamage false;
	};
};