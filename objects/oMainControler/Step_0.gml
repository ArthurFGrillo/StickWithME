/// @description control menu

	menu_x += (menu_x_target - menu_x) / menu_speed;

	if (menu_control){
		if(keyboard_check_pressed(vk_up) || keyboard_check(ord("W"))){
			audio_play_sound(sdClick1,10,false);
			menu_cursor++;
			if(menu_cursor >= menu_items) menu_cursor = 0;
		}
		if(keyboard_check_pressed(vk_down) || keyboard_check(ord("S"))){
			audio_play_sound(sdClick1,10,false);
			menu_cursor--;
			if(menu_cursor < 0) menu_cursor = menu_items-1;
		}
		if(keyboard_check_pressed(vk_enter) ||  keyboard_check(ord("Z")) || mouse_check_button(mb_left)){
			room_goto(RoomStageOne);
			menu_x_target = gui_width+700;
			menu_committed = menu_cursor;
			menu_control = false;
			audio_play_sound(sdClick2,10,false);
			audio_play_sound(sdMusic,2,true);
		}
	}
	
	/*
	keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
	keyRigth = keyboard_check(vk_right) || keyboard_check(ord("D"));
	keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"));
	keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));
	
	//get rotation
	keyClock = keyboard_check(ord("X")) || mouse_check_button(mb_right);
	keyCounterClock = keyboard_check(ord("Z")) || mouse_check_button(mb_left);
	*/
	
	if(menu_x > gui_width+150) && (menu_committed != -1){
		switch(menu_committed){
			case 1: default: 
				if(once == false){
					oPlayer.playerControl = true;
					once = true;
				}			 
			break;	
			case 0: game_end(); break;
		}
	}