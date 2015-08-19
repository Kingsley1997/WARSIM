class WS_GUI_Progression
{
	idd = 456321;
	movingenable = false;
	
	onLoad = "_this call compile preprocessFileLineNumbers 'ui\progression\init.sqf';";

	class controls 
	{
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 0.396849 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.206302 * safezoneW;
			h = 0.13 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class IGUIBack_2201: WS_Header
		{
			idc = 2201;
			text = "YOUR PROGRESSION";
			x = 0.396849 * safezoneW + safezoneX;
			y = 0.3328 * safezoneH + safezoneY;
			w = 0.206302 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.407164 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0412603 * safezoneW;
			h = 0.086 * safezoneH;
		};
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			text = "";
			x = 0.453582 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.139254 * safezoneW;
			h = 0.086 * safezoneH;
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Close"; //--- ToDo: Localize;
			x = 0.551575 * safezoneW + safezoneX;
			y = 0.4892 * safezoneH + safezoneY;
			w = 0.0515754 * safezoneW;
			h = 0.022 * safezoneH;
			action = "closeDialog 0;";
		};
		class RscButton_1601: RscButtonSpacer
		{
			idc = 1601;
			x = 0.396849 * safezoneW + safezoneX;
			y = 0.4892 * safezoneH + safezoneY;
			w = 0.153694 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};