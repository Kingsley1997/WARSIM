class WS_GUI_LS
{
	idd = 9584;
	movingenable = false;
	
	onLoad = "_this call ui_lsInit";

	class controls 
	{
		class WSGUICAS_Back: IGUIBack
		{
			idc = -1;
			x = 0.293698 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.412603 * safezoneW;
			h = 0.5038 * safezoneH;
		};
		class WSGUICAS_Header: WS_Header
		{
			idc = -1;
			text = "WARSIM LOGISTICAL SUPPORT"; //--- ToDo: Localize;
			x = 0.293698 * safezoneW + safezoneX;
			y = 0.2228 * safezoneH + safezoneY;
			w = 0.412603 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class WSGUICAS_BtnClose: RscButton
		{
			idc = -1;
			text = "Close"; //--- ToDo: Localize;
			x = 0.649568 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.056733 * safezoneW;
			h = 0.022 * safezoneH;
			action = "closeDialog 0;";
		};
		class WSGUICAS_BtnCloseSpacer: RscButtonSpacer
		{
			idc = -1;
			x = 0.293698 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.354838 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class WSGUICAS_LBTypes: RscListbox
		{
			idc = 1500;
			x = 0.298856 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.144411 * safezoneW;
			h = 0.484 * safezoneH;
		};
		class WSGUICAS_Map: RscMapControl
		{
			idc = 1200;
			x = 0.448425 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.25272 * safezoneW;
			h = 0.451 * safezoneH;
			onMouseButtonClick = "_this call ui_ls_clickMap";
		};
		class WSGUICAS_BtnRequest: RscButton
		{
			idc = 1602;
			text = "Confirm Request"; //--- ToDo: Localize;
			x = 0.54126 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.159884 * safezoneW;
			h = 0.022 * safezoneH;
			action = "execVM 'ui\ls\ui_confirmRequest.sqf'";
		};
	};
};