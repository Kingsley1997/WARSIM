class WS_GUI_OP_Namer
{
	idd = 75695;
	movingenable = false;
	
	onLoad = "_this call compile preprocessFileLineNumbers 'ui\op\init.sqf';";

	class controls 
	{
		class WSGUINamer_Back: IGUIBack
		{
			idc = -1;
			x = 0.396849 * safezoneW + safezoneX;
			y = 0.3152 * safezoneH + safezoneY;
			w = 0.175356 * safezoneW;
			h = 0.143 * safezoneH;
		};
		class WSGUINamer_Head: WS_Header
		{
			idc = -1;
			text = "NAME YOUR OBSERVATION POST"; //--- ToDo: Localize;
			x = 0.396849 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.175356 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class WSGUINamer_BtnAccept: RscButton
		{
			idc = 1600;
			text = "Accept"; //--- ToDo: Localize;
			x = 0.52063 * safezoneW + safezoneX;
			y = 0.4582 * safezoneH + safezoneY;
			w = 0.0515754 * safezoneW;
			h = 0.022 * safezoneH;
			action = "closeDialog 0; execVM 'ui\op\accept.sqf';";
		};
		class WSGUINamer_BtnCancel: RscButton
		{
			idc = 1601;
			text = "Cancel"; //--- ToDo: Localize;
			x = 0.396849 * safezoneW + safezoneX;
			y = 0.4582 * safezoneH + safezoneY;
			w = 0.0515754 * safezoneW;
			h = 0.022 * safezoneH;
			action = "closeDialog 0;";
		};
		class WSGUINamer_BtnSpacer: RscButtonSpacer
		{
			idc = -1;
			x = 0.449457 * safezoneW + safezoneX;
			y = 0.4582 * safezoneH + safezoneY;
			w = 0.0701426 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class WSGUINamer_TextBox: RscEdit
		{
			idc = 1400;
			x = 0.402007 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.165041 * safezoneW;
			h = 0.022 * safezoneH;
			canModify = 1;
			onKeyUp = "_null = [_this] execVM 'ui\op\keyUp.sqf';";
		};	
		class WSGUINamer_StrText_Output: RscStructuredText
		{
			idc = 1100;
			x = 0.402007 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.165041 * safezoneW;
			h = 0.088 * safezoneH;
		};
	};
};