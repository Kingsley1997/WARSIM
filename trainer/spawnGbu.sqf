openMap true;
mapClick = false;
_Bombs = 32;

onMapSingleClick "clickpos = _pos; mapClick = true;";

while { true } do {
	waituntil { mapClick };
	
	for "_i" from 0 to _Bombs do {
		_target = [( clickpos select 0), ( clickpos select 1), 1];
		_dist = random 250;
		_dir = random 360;
		_rot = random 360;
		_pos = _target;
		_positions = [(_pos select 0) + (sin _dir) * _dist, (_pos select 1) + (cos _dir) * _dist, 0];
		
		"Bo_GBU12_LGB" createvehicle _positions;
		mapClick = false;
	};
};