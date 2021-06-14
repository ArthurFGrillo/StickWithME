/// @description Insert description here
// You can write your code in this editor

	move_wrap(true,true,sprite_width);
	
	if(oPlayer.playerControl){
		image_xscale = min(image_xscale+0.1,scale);
		image_yscale = min(image_yscale+0.1,scale);
	}
	