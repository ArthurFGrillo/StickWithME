/// @description Move n Rotate

	if(keyboard_check(vk_escape)){
		game_restart();	
	}	
	
	if(keyboard_check(ord("M"))){
		audio_stop_sound(sdMusic);	
	}	
	
#region //get inputs
	//get direction
	
	keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
	keyRigth = keyboard_check(vk_right) || keyboard_check(ord("D"));
	keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"));
	keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));
	
	//get rotation
	keyClock = keyboard_check(ord("X")) || mouse_check_button(mb_right);
	keyCounterClock = keyboard_check(ord("Z")) || mouse_check_button(mb_left);
	
	//get input
	inputDirection = point_direction(0,0,keyRigth-keyLeft,keyDown-keyUp);
	inputMagnitude = (keyRigth-keyLeft != 0) || (keyDown-keyUp != 0);

	
#endregion

#region //ajust speed

	rotSpd = 2;
	SpdMove = 3.0;
	
	if(rad > 170){
		global.radSprite = 3;
		rotSpd = 0.5;
	}else if(rad > 120){
		global.radSprite = 2;
		rotSpd = 1;
	}else if(rad > 50){
		global.radSprite = 1;
		rotSpd = 2
	}else{
		global.radSprite = 0;
		rotSpd = 4
	}
	
	if(pesoPlayer > 50){
		global.pesoSprite = 3;
		SpdMove = 2.5;
	}else if(pesoPlayer > 30){
		global.pesoSprite = 2;
		SpdMove = 3;
	}else if(pesoPlayer > 15){
		global.pesoSprite = 1;
		SpdMove = 3.5;
	}else{
		global.pesoSprite = 0;
		SpdMove = 4.0;
	}
	
#endregion

	//Get spd
	hSpd = lengthdir_x(inputMagnitude * SpdMove, inputDirection);
	VSpd = lengthdir_y(inputMagnitude * SpdMove, inputDirection);
	
	//get ang
	ang = (keyCounterClock*rotSpd)-(keyClock*rotSpd);
	
	if(playerControl){
	//rotate center
		direction += ang;
	
		//move center
		x += hSpd;
		y += VSpd;
	}
	
	//body code
	with(oGroup){
		if(Joined){
			#region // move if joined
			//move body
			x += other.hSpd;
			y += other.VSpd;
		
			//get current cordinates
			var _old_ang = point_direction(other.x,other.y,x,y);
			var _dist = point_distance(other.x,other.y,x,y);
		
			//get new angle
			var _new_ang = _old_ang + other.ang;
		
			//get new cordinates
			var new_x = other.x + lengthdir_x(_dist,_new_ang);
			var new_y = other.y + lengthdir_y(_dist,_new_ang);
		
			//move do new cordinates
			x = new_x;
			y = new_y;
			
			//rotate body
			direction += other.ang;
			image_angle = direction;
			#endregion
		}
		
	}
	
	if(global.hitP <= 0){
		if(global.GameOver == false){
			audio_play_sound(sdDeathPlayer,15,false);
			audio_stop_sound(sdMusic);
		}
		global.GameOver = true;
		playerControl = false;
		flash += 10;
		with(oGroup){
			instance_destroy();		
		}
	}
	
	if(global.win){
		if(yay == false){
			audio_play_sound(sdYAY,15,false);
			audio_stop_sound(sdMusic);
			yay = true;
		}
		playerControl = false;
		flash += 10;
	}
	
	
	