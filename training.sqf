if (!isServer || !isDedicated) exitWith {};

trSign_t setObjectTextureGlobal [0, (["SERGEANT", "texture"] call BIS_fnc_rankParams)];
trSign_t attachTo [trSign, [0, -0.05, 0.6]];

trSignAdv_t setObjectTextureGlobal [0, (["COLONEL", "texture"] call BIS_fnc_rankParams)];
trSignAdv_t attachTo [trSignAdv, [0, -0.05, 0.6]];