/// @description Insert description here
// You can write your code in this editor
	
	if(keyboard_check(vk_space)){
	//	flash = 5;
	//	death = true;
		//goal = true;
	}
	
	
	if(goal){
		move_towards_point(oGoal.x,oGoal.y,2);
		
		if(place_meeting(x,y,oGoal)){
			flash = 5;
			death = true;
		}
	}
	
	if(death){
		if(deathcount < 0){
			instance_destroy();	
		}
		deathcount--;
	}
