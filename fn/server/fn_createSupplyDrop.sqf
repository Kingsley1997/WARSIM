private ["_supply","_chute","_pos","_class"];

_pos = _this select 0;
_class = _this select 1;
_height = _this select 2;

sleep 5;

_supply = createVehicle [_class, [_pos select 0, _pos select 1, (_pos select 2) + _height], [], 0, "NONE"];
_chute = createVehicle ["B_parachute_02_F", [_pos select 0, _pos select 1, (_pos select 2) + _height], [], 0, "CAN_COLLIDE"];

_supply allowDamage false;
_supply attachTo [_chute, [0,0,0]];