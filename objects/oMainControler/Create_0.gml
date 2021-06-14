/// @description GUI bars Menu Seet UP

	
	#region //menu
	gui_width = display_get_gui_width();
	gui_height = display_get_gui_height();
	gui_margin = 64;
	
	menu_x = gui_width + 200;
	menu_y = gui_height- gui_margin
	menu_x_target = gui_width - gui_margin;
	menu_speed = 25;
	menu_font = fMenu;
	menu_itemheight = font_get_size(fMenu);
	menu_committed = -1;
	menu_control = true;
	 
	menu[1] = "Start Game";
	menu[0] = "Quit";
	
	once = false;
	
	menu_items = array_length(menu);
	menu_cursor = 1;
	#endregion
	
	
	