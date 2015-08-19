class WS_GUI_Jobs
{
	idd = -1;
	movingenable = false;
	
	onLoad = "_this call ui_jobsInit";

	class controls
	{
		class WSGUIJobs_Back: IGUIBack
		{
			idc = -1;
			x = 0.304013 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.397131 * safezoneW;
			h = 0.484 * safezoneH;
		};
		class WSGUIJobs_Header: WS_Header
		{
			idc = 2201;
			text = "BASIC ROLES";
			x = 0.304013 * safezoneW + safezoneX;
			y = 0.2338 * safezoneH + safezoneY;
			w = 0.397131 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class WSGUIJobs_StrText_01: RscStructuredText
		{
			idc = 1100;
			x = 0.309171 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0928357 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class WSGUIJobs_Pic_01: RscPicture
		{
			idc = 1200;
			text = "ui\jobs\img\medic.paa";
			x = 0.309171 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0928357 * safezoneW;
			h = 0.308 * safezoneH;
		};
		class WSGUIJobs_Btn_01: RscButton
		{
			idc = 1600;
			text = "PRIVATE"; //--- ToDo: Localize;
			x = 0.309171 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0928357 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class WSGUIJobs_Pic_02: RscPicture
		{
			idc = 1201;
			text = "ui\jobs\img\repair.paa";
			x = 0.407164 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0928357 * safezoneW;
			h = 0.308 * safezoneH;
		};
		class WSGUIJobs_StrText_02: RscStructuredText
		{
			idc = 1101;
			text = "";
			x = 0.407164 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0928357 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class WSGUIJobs_Btn_02: RscButton
		{
			idc = 1601;
			text = "CORPORAL"; //--- ToDo: Localize;
			x = 0.407164 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0928357 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class WSGUIJobs_Pic_03: RscPicture
		{
			idc = 1202;
			text = "ui\jobs\img\pilot.paa";
			x = 0.505158 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0928357 * safezoneW;
			h = 0.308 * safezoneH;
		};
		class WSGUIJobs_StrText_03: RscStructuredText
		{
			idc = 1102;
			text = "";
			x = 0.505158 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0928357 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class WSGUIJobs_Btn_03: RscButton
		{
			idc = 1602;
			text = "SERGEANT"; //--- ToDo: Localize;
			x = 0.505158 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0928357 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class WSGUIJobs_Pic_04: RscPicture
		{
			idc = 1203;
			text = "ui\jobs\img\sniper.paa";
			x = 0.603151 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0928357 * safezoneW;
			h = 0.308 * safezoneH;
		};
		class WSGUIJobs_StrText_04: RscStructuredText
		{
			idc = 1103;
			text = "";
			x = 0.603151 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0928357 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class WSGUIJobs_Btn_04: RscButton
		{
			idc = 1603;
			text = "LIEUTENANT"; //--- ToDo: Localize;
			x = 0.603151 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0928357 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class WSGUIJobs_Btn_Close: RscButton
		{
			idc = 1604;
			text = "Close"; //--- ToDo: Localize;
			x = 0.639254 * safezoneW + safezoneX;
			y = 0.7442 * safezoneH + safezoneY;
			w = 0.0618905 * safezoneW;
			h = 0.022 * safezoneH;
			action = "closeDialog 0;";
		};
		class WSGUIJobs_Btn_Spacer: RscButtonSpacer
		{
			idc = 1605;
			x = 0.304013 * safezoneW + safezoneX;
			y = 0.7442 * safezoneH + safezoneY;
			w = 0.334208 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};