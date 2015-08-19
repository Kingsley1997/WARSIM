disableSerialization;

_display = _this select 0;

// Medic
_left1_img = _display displayctrl 1200;
_left1_text = _display displayctrl 1100;
_left1_btn = _display displayctrl 1600;
_left1_text ctrlSetStructuredText parseText "<t align='center' size='1.25'>Para Trooper</t><br /><t align='left' size='0.75'>- HALO INSERTIONS<br />- SPEC OPS MISSIONS<br />- ELITE WARRIOR</t>";

// Repair
_left2_img = _display displayctrl 1201;
_left2_text = _display displayctrl 1101;
_left2_btn = _display displayctrl 1601;
_left2_text ctrlSetStructuredText parseText "<t align='center' size='1.25'>Paramedic</t><br /><t align='left' size='0.75'>- HEAL TO 100%<br />- 200% FASTER REVIVE<br />- SPEC OPS MISSIONS</t>";

// Pilot
_right2_img = _display displayctrl 1202;
_right2_text = _display displayctrl 1102;
_right2_btn = _display displayctrl 1602;
_right2_text ctrlSetStructuredText parseText "<t align='center' size='1.25'>Recon Scout</t><br /><t align='left' size='0.75'>- DEADLIEST MISSIONS<br />- STEALTH TACTICS<br />- UNSTOPPABLE FORCE</t>";

// Sniper
_right1_img = _display displayctrl 1203;
_right1_text = _display displayctrl 1103;
_right1_btn = _display displayctrl 1603;
_right1_text ctrlSetStructuredText parseText "<t align='center' size='1.25'>Unknown</t><br /><t align='left' size='0.75'>- COULD BE DANGEROUS<br />- REWARDING?<br />- WE DON'T KNOW</t>";
