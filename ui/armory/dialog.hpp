class WS_GUI_Armory
{
	idd = -1;
	movingenable = false;
	
	onLoad = "_this call ui_armoryInit";

	class controls 
	{
		class WSGUIArmory_Back: IGUIBack
		{
			idc = -1;
			x = 0 * GUI_GRID_W + GUI_GRID_X;
			y = 1.1 * GUI_GRID_H + GUI_GRID_Y;
			w = 38.5 * GUI_GRID_W;
			h = 16.9 * GUI_GRID_H;
		};
		class WSGUIArmory_Header: WS_Header
		{
			idc = -1;
			text = "WARSIM ARMORY"; //--- ToDo: Localize;
			x = 0 * GUI_GRID_W + GUI_GRID_X;
			y = 0 * GUI_GRID_H + GUI_GRID_Y;
			w = 38.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class WSGUIArmory_BtnClose: RscButton
		{
			idc = -1;
			action = "closeDialog 0;";
			text = "Close"; //--- ToDo: Localize;
			x = 33.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18.1 * GUI_GRID_H + GUI_GRID_Y;
			w = 5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class WSGUIArmory_BtnSpacer: RscButtonSpacer
		{
			idc = -1;
			x = 0 * GUI_GRID_W + GUI_GRID_X;
			y = 18.1 * GUI_GRID_H + GUI_GRID_Y;
			w = 33.4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class WSGUIArmory_Controls: RscXListBox
		{
			idc = 1500;
			onLBSelChanged = "_this call ui_pageChange;";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 37.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class WSGUIArmory_Slot01_Picture: RscPicture
		{
			idc = 1200;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
		};
		class WSGUIArmory_Slot01_StrText: RscStructuredText
		{
			idc = 1100;
			style = "0x02";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class WSGUIArmory_Slot01_BtnAdd: RscButton
		{
			idc = 1601;

			text = "Select Kit"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class WSGUIArmory_Slot02_Picture: RscPicture
		{
			idc = 1201;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
		};
		class WSGUIArmory_Slot02_BtnAdd: RscButton
		{
			idc = 1602;

			text = "Select Kit"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class WSGUIArmory_Slot02_StrText: RscStructuredText
		{
			idc = 1101;

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class WSGUIArmory_Slot03_Picture: RscPicture
		{
			idc = 1202;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
		};
		class WSGUIArmory_Slot03_StrText: RscStructuredText
		{
			idc = 1102;

			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class WSGUIArmory_Slot03_BtnAdd: RscButton
		{
			idc = 1603;

			text = "Select Kit"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class WSGUIArmory_Slot04_Picture: RscPicture
		{
			idc = 1203;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
		};
		class WSGUIArmory_Slot04_StrText: RscStructuredText
		{
			idc = 1103;

			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class WSGUIArmory_Slot04_BtnAdd: RscButton
		{
			idc = 1604;

			text = "Select Kit"; //--- ToDo: Localize;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class WSGUIArmory_Slot05_Picture: RscPicture
		{
			idc = 1204;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 19.5 * GUI_GRID_W + GUI_GRID_X;
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
		};
		class WSGUIArmory_Slot05_StrText: RscStructuredText
		{
			idc = 1104;

			x = 19.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class WSGUIArmory_Slot05_BtnAdd: RscButton
		{
			idc = 1605;

			text = "Select Kit"; //--- ToDo: Localize;
			x = 19.5 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class WSGUIArmory_Slot06_Picture: RscPicture
		{
			idc = 1205;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 19.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
		};
		class WSGUIArmory_Slot06_StrText: RscStructuredText
		{
			idc = 1105;

			x = 19.5 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class WSGUIArmory_Slot06_BtnAdd: RscButton
		{
			idc = 1606;

			text = "Select Kit"; //--- ToDo: Localize;
			x = 19.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class WSGUIArmory_Slot07_Picture: RscPicture
		{
			idc = 1206;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 29 * GUI_GRID_W + GUI_GRID_X;
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
		};
		class WSGUIArmory_Slot07_StrText: RscStructuredText
		{
			idc = 1106;

			x = 29 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class WSGUIArmory_Slot07_BtnAdd: RscButton
		{
			idc = 1607;

			text = "Select Kit"; //--- ToDo: Localize;
			x = 29 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class WSGUIArmory_Slot08_Picture: RscPicture
		{
			idc = 1207;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 29 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
		};
		class WSGUIArmory_Slot08_StrText: RscStructuredText
		{
			idc = 1107;

			x = 29 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class WSGUIArmory_Slot08_BtnAdd: RscButton
		{
			idc = 1608;

			text = "Select Kit"; //--- ToDo: Localize;
			x = 29 * GUI_GRID_W + GUI_GRID_X;
			y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};
};