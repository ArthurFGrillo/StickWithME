// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Draw_Blocks(){
	
	//get color
	var _col;
	if(goal) _col = CorGoal;
	else if(Joined) _col = CorBlockJoin;
	else _col =	CorBlock;	
	
	//get angle
	var _ang;
	if(object_index = oBallMedium || object_index = oBallSmall || object_index = oBallLarge){
		_ang = 0;
	}else _ang = image_angle;
	
	//draw
	draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,_ang,_col,1);
	
}

#macro CorPlayer make_color_rgb(255,235,59)
#macro CorBlock make_color_rgb(3,169,244)
#macro CorBlockJoin make_color_rgb(255,160,0)
#macro CorGoal make_color_rgb(240,98,146)
#macro CorHP make_color_rgb(221,25,29)
