if (typeOf _this != "Flag_UK_F") then {
	_this addAction ["<t color='#FF0000'>Delete Object</t>", "builder\deleteObject.sqf", [], 1.5, false, true, "(toLower (_this getVariable ['playerRole', 'DEFAULT'])) == 'repair'"];
};