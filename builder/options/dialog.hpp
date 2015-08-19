class WS_BUILDER_Options
{
	idd = -1;
	movingenable = false;
	
	onLoad = "null = [_this] execVM 'builder\options\init.sqf'";

	class controls 
	{
		class WSGUIOptions_RotateSlider: RscXSlider
		{
			idc = 1900;
			x = 0 * GUI_GRID_W + GUI_GRID_X;
			y = 24 * GUI_GRID_H + GUI_GRID_Y;
			w = 40 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onSliderPosChanged = "null = [_this] execVM 'builder\options\sliderChanged.sqf'";
		};
	};
};