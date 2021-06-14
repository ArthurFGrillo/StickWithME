/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

	#region // move if joined
		
	//get current cordinates
	var _old_ang = point_direction(rotx,roty,x,y);
	var _dist = point_distance(rotx,roty,x,y);
		
	//get new angle
	var _new_ang = _old_ang + rot;
		
	//get new cordinates
	var new_x = rotx + lengthdir_x(_dist,_new_ang);
	var new_y = roty + lengthdir_y(_dist,_new_ang);
		
	//move do new cordinates
	x = new_x;
	y = new_y;
			
	//rotate body
	direction +=rot;
	//image_angle = direction;
	#endregion

	

