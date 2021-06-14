/// @description update camera
	
	var seconds_passed = delta_time/1000000;
	
	if(oPlayer.rad > 75){
		var new_w = camera_get_view_width(cam)+10;
		var new_h = camera_get_view_height(cam)+5.625;
		camera_set_view_size(cam,clamp(new_w,640,1280),clamp(new_h,360,720));
	}else{
		var new_w = camera_get_view_width(cam)-10;
		var new_h = camera_get_view_height(cam)-5.625;
		camera_set_view_size(cam,clamp(new_w,640,1280),clamp(new_h,360,720));
	}
	
	//get viewpor size
	viewWidthHalf = camera_get_view_width(cam) * 0.5;
	viewHeightHalf = camera_get_view_height(cam) * 0.5;
	
	//Update Destination
	if(instance_exists(follow)){
		xTo = follow.x;
		yTo = follow.y;
	}
	
	//update Object Position
	x += (xTo - x) * (seconds_passed*cameraChase);
	y += (yTo - y) * (seconds_passed*cameraChase);
	
	// keep camera center inside room
	x = clamp(x,viewWidthHalf+buff,room_width - viewWidthHalf-buff);
	y = clamp(y,viewHeightHalf+buff,room_height - viewHeightHalf-buff);
	
	x += random_range(-shake_remain, shake_remain);
	y += random_range(-shake_remain, shake_remain);
	shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));
	
	//update camera
	camera_set_view_pos(cam,x-viewWidthHalf,y-viewHeightHalf);
	
	if(GridLayer){
		
		var lx = layer_get_x(GridLayer);
		var ly = layer_get_y(GridLayer);
		
		lx += (x - px)*0.1;
		ly += (y - py)*0.1;
		
		layer_x(GridLayer,lx);
		layer_y(GridLayer,ly);
	}
	
	if(PlatesLayer){
		
		var lx = layer_get_x(PlatesLayer);
		var ly = layer_get_y(PlatesLayer);
		
		lx += (x - px)*0.05;
		ly += (y - py)*0.05;
		
		layer_x(PlatesLayer,lx);
		layer_y(PlatesLayer,ly);
	}
	
	px = x;
	py = y;