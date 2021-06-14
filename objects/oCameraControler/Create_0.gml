/// @description create camera

	cam = view_camera[0];

	if(instance_exists(oPlayer)){
		follow = oPlayer;
		x = follow.x;
		y = follow.y;
	}

	viewWidthHalf = camera_get_view_width(cam) * 0.5;
	viewHeightHalf = camera_get_view_height(cam) * 0.5;
	
	xTo = xstart;
	yTo = ystart;
	
	px = x;
	py = y;
	
	if(layer_exists("Grid")){
		GridLayer = layer_get_id("Grid");
	}
	
	if(layer_exists("Plates")){
		PlatesLayer = layer_get_id("Plates");
	}
	
	
	/*
	if(layer_exists("Stars")){
		starlayer = layer_get_id("Stars");
	}
	
	if(layer_exists("StarsDeep")){
		starlayerdeep = layer_get_id("StarsDeep");
	}
	*/
	
	cameraChase = 10;
	
	shake_length = 0;
	shake_magnitude = 0;
	shake_remain = 0;
	buff = 16;
	