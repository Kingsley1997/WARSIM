private ["_unit", "_uniforms", "_headgears", "_vests", "_randUniform", "_randHeadgear", "_randVest"];

_unit = _this select 0;

// if (!isServer || !isDedicated) exitWith {};

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

_uniforms = ["U_BG_Guerrilla_6_1", "U_BG_Guerilla1_1", "U_BG_Guerilla3_1", "U_C_HunterBody_grn", "U_BG_leader"];
_headgears = ["H_Shemag_olive", "H_ShemagOpen_tan", "H_Bandanna_camo"];
_vests = ["V_TacVest_oli", "V_TacVest_khk"];

_randUniform = _uniforms select floor random count _uniforms;
_randHeadgear = _headgears select floor random count _headgears;
_randVest = _vests select floor random count _vests;

_unit forceAddUniform _randUniform;
for "_i" from 1 to 2 do {_unit addItemToUniform "30Rnd_65x39_caseless_green";};
_unit addVest _randVest;
for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 3 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
_unit addHeadgear _randHeadgear;
_unit addWeapon "arifle_Katiba_F";
_unit addPrimaryWeaponItem "optic_ACO_grn";
_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";

_unit