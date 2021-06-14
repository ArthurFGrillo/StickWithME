/// @description Insert description here

//turn off draw
visible = false;

//make sprite flash
flash = 0;

Joined = false;

goal = false;

death = false;
deathcount = 5;

//peso = 1;
	
image_blend = c_orange;
	
#region //outline shader - Create
upixelH = shader_get_uniform(shOutline,"pixelH");
upixelW = shader_get_uniform(shOutline,"pixelW");
texelH = 1*texture_get_texel_height(sprite_get_texture(sprite_index,0));
texelW = 1*texture_get_texel_width(sprite_get_texture(sprite_index,0));
#endregion