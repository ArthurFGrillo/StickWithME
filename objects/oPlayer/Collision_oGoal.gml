///
	with(oGroup){
		if(Joined){
			goal = true;
			Joined = false;
			
		}	
	}
	
	var p
	var m = 1+(global.radSprite*0.5);
	for(p = pesoPlayer-1; p > 0; p--){
		global.points += p*m;
	}
	
	pesoPlayer = 1;
	rad = 0;
	
	if(global.saved >= ToBeSaved){
		global.win = true;	
	}
