class WS_GUI_Menu
{
	idd = -1;
	movingenable = false;
	
	onLoad = "null = [_this] execVM 'ui\menu\init.sqf'";

	class controls 
	{
		class WSGUIMenu_Back: IGUIBack
		{
			idc = -1;
			x = 0.438109 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.123781 * safezoneW;
			h = 0.275 * safezoneH;
		};
		class WSGUIMenu_Header: WS_Header
		{
			idc = -1;
			text = "WARSIM MENU"; //--- ToDo: Localize;
			x = 0.438109 * safezoneW + safezoneX;
			y = 0.2448 * safezoneH + safezoneY;
			w = 0.123781 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class WSGUIMenu_Btn_01: RscButton
		{
			idc = 1600;
			x = 0.443267 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.113466 * safezoneW;
			h = 0.022 * safezoneH;
			text = "Create Rally Point";
			action = "closeDialog 0; execVM 'ui\menu\fn_rallyPoint.sqf';";
		};
		class WSGUIMenu_Btn_02: RscButton
		{
			idc = 1601;
			x = 0.443267 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.113466 * safezoneW;
			h = 0.022 * safezoneH;
			text = "View Distance";
			action = "closeDialog 0; call CHVD_fnc_openDialog;";
		};
		class WSGUIMenu_Btn_03: RscButton
		{
			idc = 1602;
			x = 0.443267 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.113466 * safezoneW;
			h = 0.022 * safezoneH;
			text = "Group Manager";
			action = "closeDialog 0; ([] call BIS_fnc_displayMission) createDisplay 'RscDisplayDynamicGroups';";
		};
		class WSGUIMenu_Btn_04: RscButton
		{
			idc = 1603;
			x = 0.443267 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.113466 * safezoneW;
			h = 0.022 * safezoneH;
			text = "Logistical Support";
			action = "closeDialog 0; createDialog 'WS_GUI_LS';";
		};
		class WSGUIMenu_Btn_05: RscButton
		{
			idc = 1604;
			x = 0.443267 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.113466 * safezoneW;
			h = 0.022 * safezoneH;
			text = "Air Support";
			action = "closeDialog 0; createDialog 'WS_GUI_CAS'";
		};
		class WSGUIMenu_Btn_06: RscButton
		{
			idc = 1605;
			x = 0.443267 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.113466 * safezoneW;
			h = 0.022 * safezoneH;
			text = "Base Builder";
			action = "closeDialog 0; _null = [player] execVM 'builder\init.sqf';";
		};
		class WSGUIMenu_Btn_07: RscButtonSpacer
		{
			idc = 1606;
			x = 0.443267 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.113466 * safezoneW;
			h = 0.022 * safezoneH;
			text = "";
		};
		class WSGUIMenu_Btn_08: RscButtonSpacer
		{
			idc = 1607;
			x = 0.443267 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.113466 * safezoneW;
			h = 0.022 * safezoneH;
			text = "";
		};
		class WSGUIMenu_Btn_09: RscButton
		{
			idc = 1608;
			text = "Close";
			x = 0.438109 * safezoneW + safezoneX;
			y = 0.5462 * safezoneH + safezoneY;
			w = 0.123781 * safezoneW;
			h = 0.022 * safezoneH;
			action = "closeDialog 0;";
		};
	};
};