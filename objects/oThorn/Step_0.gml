
	if(die){
		timer -= 4;
		if(timer <= 0){
			global.hitP -= dmg;	
		}
		die = false;
	}