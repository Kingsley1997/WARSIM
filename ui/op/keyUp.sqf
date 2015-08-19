disableSerialization;

_control = _this select 0 select 0;
_text = ctrlText _control;
_display = findDisplay 75695;
_strText = _display displayCtrl 1100;
_accBtn = _display displayCtrl 1600;

if (_text == "") then {
	_strText ctrlSetStructuredText parseText "<br /><t align='CENTER' size='1'>YOUR NEW OP NAME</t><br /><t align='CENTER' size='1.25'>ENTER TEXT BELOW</t>";
	_accBtn ctrlEnable false;
} else {
	_strText ctrlSetStructuredText parseText (format ["<br /><t align='CENTER' size='1'>YOUR NEW OP NAME</t><br /><t align='CENTER' size='1.25'>OP %1</t>", toUpper _text]);
	_accBtn ctrlEnable true;
};

uiNamespace setVariable ["markOp_Text", (toUpper _text)];