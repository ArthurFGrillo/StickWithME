/// @description hit poison

if(Joined){
	var o_x = other.x;
	var o_y = other.y;
	var obj = other.object_index;
	with(oPoison){
		
		var dist = point_distance(x,y,o_x,o_y);
		if(dist < Kill_dist){
			if(object_index == obj){
				die = true;
				timer = dist;
			}
		}
	}

	with(oGroup){
		if(Joined) flash = 6;
	}
	
	oPlayer.flash = 6;
}