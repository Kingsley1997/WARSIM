_unit = _this select 0;

openMap true;
telmapClick = false;

onMapSingleClick "telclickpos = _pos; telmapClick = true;";

while { true } do {
	waituntil { telmapClick };
	_unit setPos [( telclickpos select 0), ( telclickpos select 1), 1];
	telmapClick = false;
	openMap false;
};