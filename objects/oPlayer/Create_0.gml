/// @description Set Up Variables

global.hitP = 100;
global.points = 0;

global.saved = 0;
ToBeSaved = 200;

global.GameOver = false;

global.win = false;
yay = false;

//turn off draw
visible = false;

//make sprite flash
flash = 0;

#region // movement variables

hSpd = 0;
VSpd = 0;

SpdMove = 3.0;

ang = 0;
rotSpd = 2;

pesoPlayer = 1;
rad = 0;

playerControl = false;

#endregion


#region //outline shader - Create
upixelH = shader_get_uniform(shOutline,"pixelH");
upixelW = shader_get_uniform(shOutline,"pixelW");
texelH = 1*texture_get_texel_height(sprite_get_texture(sprite_index,0));
texelW = 1*texture_get_texel_width(sprite_get_texture(sprite_index,0));
#endregion