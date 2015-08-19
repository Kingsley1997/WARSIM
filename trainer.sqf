player addAction ["Teleport", "trainer\teleport.sqf"];
player addAction ["Spawn GBU", "trainer\spawnGbu.sqf"];
player addAction ["Kill All EAST", "trainer\killall.sqf"];
player addAction ["Player Damage On", {player allowDamage true}];
player addAction ["Player Damage Off", {player allowDamage false}];
player addAction ["Camera", {[] spawn BIS_fnc_camera}];