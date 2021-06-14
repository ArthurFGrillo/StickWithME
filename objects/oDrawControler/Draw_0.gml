/// @description Draw Controler

// get instance count
var inst_num = instance_number(oGroup);
var obj_array;
var i = 0;

//set up array
for (var j = 0; j < inst_num; j++){
	obj_array[i] = -1;
}

// fill array
with(oGroup){
	obj_array[i] = id;
	i++;
}

#region //draw With Shader
	var inst;
	i = 0;
	repeat(inst_num){
		inst = obj_array[i];
		with(inst){
			shader_set(shOutline);
			shader_set_uniform_f(upixelW,texelW);
			shader_set_uniform_f(upixelH,texelH);
	
			//draw Blocks
			Draw_Blocks();
	
			shader_reset();	
		}
		i++;
	}
	
	with(oPlayer){
		shader_set(shOutline);
		shader_set_uniform_f(upixelW,texelW);
		shader_set_uniform_f(upixelH,texelH);
	
		draw_sprite_ext(sBallSmall,-1,x,y,image_xscale,image_yscale,0,c_yellow,1);
	
		shader_reset();
	}
#endregion

#region //draw WithOUT Shader
	i = 0;
	repeat(inst_num){
		inst = obj_array[i];
		with(inst){
			Draw_Blocks();
		}
		i++;
	}
	
	i = 0;
	repeat(inst_num){
		inst = obj_array[i];
		with(inst){
			if(Joined) draw_sprite_ext(sEyes,-1,x,y,image_xscale,image_yscale,0,c_white,1);
			else draw_sprite_ext(sEyesHappy,-1,x,y,image_xscale,image_yscale,0,c_white,1);
		}
		i++;
	}
	
	
	
	with(oPlayer){
		draw_sprite_ext(sBallSmall,-1,x,y,image_xscale,image_yscale,0,CorPlayer,1);
		draw_sprite_ext(sprite_index,-1,x+2*(keyRigth-keyLeft),y+2*(keyDown-keyUp),image_xscale,image_yscale,0,c_white,1);	
	}
#endregion

#region //draw hit flash Shader
	i = 0;
	repeat(inst_num){
		inst = obj_array[i];
		with(inst){
			if(flash > 0){
				var _size = 1+(0.1*(5 - flash));
				draw_sprite_ext(sprite_index,-1,x,y,image_xscale*_size,image_yscale*_size,image_angle,c_white,1);
				draw_sprite_ext(sEyesHappy,-1,x,y,image_xscale,image_yscale,0,c_white,1);
				flash--;	
			}	
		}
		i++;
	}
	
	with(oPlayer){
		if(flash > 0){
			var _size = 1+(0.1*(8 - flash));
			draw_sprite_ext(sBallSmall,-1,x,y,image_xscale*_size,image_yscale*_size,image_angle,c_white,1);
			flash--;
			
			draw_sprite_ext(sEyesHappy,-1,x+2*(keyRigth-keyLeft),y+2*(keyDown-keyUp),image_xscale,image_yscale,0,c_white,1);	
		}	
	}
	
#endregion

