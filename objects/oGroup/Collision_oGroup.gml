/// @description join group

if(!goal){
	if(Joined){
	
		if(!other.Joined){
			oPlayer.pesoPlayer += other.peso;
		
			var _dist = point_distance(oPlayer.x,oPlayer.y,other.x,other.y);
			if(_dist > oPlayer.rad){
				oPlayer.rad = _dist;
			}	
		
			flash = 5;
			other.flash = 5;
			oPlayer.flash = 5;
			audio_play_sound(sdClick1,10,false);
		}
	
		other.Joined = true;
		

	}
}
