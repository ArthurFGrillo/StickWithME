/// @description Insert description here
// You can write your code in this editor
if(!other.goal){
	if(!other.Joined){
		
		pesoPlayer += other.peso;
		
		var _dist = point_distance(x,y,other.x,other.y);
		if(_dist > rad){
			rad = _dist;
		}
		
		flash = 5;
		other.flash = 5;
		audio_play_sound(sdClick2,10,false);

	}
	
	other.Joined = true;
}
