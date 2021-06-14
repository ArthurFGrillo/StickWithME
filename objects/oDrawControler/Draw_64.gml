/// @description Insert description here
// You can write your code in this editor	
	
/// @description draw GUI
	if(oPlayer.playerControl){
		marginY += (getMarginY - marginY) / 25;
	}
	
	halfWidth = getWidth/2;
	halfHeight = getHeight/2;
	
	var _goal = point_distance(oPlayer.x,oPlayer.y,oGoal.x,oGoal.y);
	
	if(_goal > 400){
		var _Point_Goal = point_direction(oPlayer.x,oPlayer.y,oGoal.x,oGoal.y);
		draw_sprite_ext(sCompass,-1,halfWidth,halfHeight,2.5,2.5,_Point_Goal+90,c_white,0.5);
	}
	
#region //peso

	if(lastPeso != global.pesoSprite){
		PesoFlash = 5;	
	} else {
		PesoFlash--;
	}
	
	lastPeso = global.pesoSprite;

	if(PesoFlash > 0){
		shader_set(shFlash);
		draw_sprite_ext(sUI_Peso,lastPeso,getMarginX,marginY,3,3,0,c_white,1);
		shader_reset();
	}else{
		draw_sprite_ext(sUI_Peso,lastPeso,getMarginX,marginY,3,3,0,c_white,1);
	}
	
#endregion

#region //rad

	if(lastRad != global.radSprite){
		RadFlash = 5;	
	} else {
		RadFlash--;
	}
	
	lastRad = global.radSprite;

	if(PesoFlash > 0){
		shader_set(shFlash);
		draw_sprite_ext(sUI_rad,lastRad,getMarginX*3,marginY,3,3,0,c_white,1);
		shader_reset();
	}else{
		draw_sprite_ext(sUI_rad,lastRad,getMarginX*3,marginY,3,3,0,c_white,1);
	}
	
#endregion
	
#region // icons
	
	draw_sprite_ext(sUI_HP,lastRad,getMarginX*7,marginY,3,3,0,c_white,1);
	draw_sprite_ext(sUI_Points,lastRad,getMarginX*12,marginY,3,3,0,c_white,1);
	draw_sprite_ext(sUI_Time,lastRad,getMarginX*25,marginY,3,3,0,c_white,1);
	
#endregion

#region // draw text
	
	//set font
	draw_set_font(fMenu);
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	
	//HP
	var xx = (getMarginX * 7) + 64;
	var yy = marginY;
	var col = CorHP;
	var HP = max(global.hitP,0);
	var txt = string(HP);
	var offset = 3;
	
	draw_set_color(c_black);
	draw_text(xx-offset,yy,txt);
	draw_text(xx+offset,yy,txt);
	draw_text(xx,yy-offset,txt);
	draw_text(xx,yy+offset,txt);
	draw_set_color(col);
	draw_text(xx,yy,txt);
	
	//Points
	xx = (getMarginX * 12) + 96;
	col = CorGoal;
	
	txt = string(help);
	txt = string_insert(" / ", txt, 0);
	txt = string_insert(global.saved, txt, 0);
	txt = string_insert(" - ", txt, 0);
	txt = string_insert(string(global.points), txt, 0);
	
	
	draw_set_color(c_black);
	draw_text(xx-offset,yy,txt);
	draw_text(xx+offset,yy,txt);
	draw_text(xx,yy-offset,txt);
	draw_text(xx,yy+offset,txt);
	draw_set_color(col);
	draw_text(xx,yy,txt);
	
	//Time
	xx = (getMarginX * 25) + 64;
	col = c_white;
	
	var sec = (timer div 60)
	var h = (sec div 3600);
	var m = ((sec - (3600*h)) div 60);
	var s = ((sec - (3600*h)) - (m*60));
	
	txt = string(timer);
	txt = string_insert(" - FC: ", txt, 0);
	txt = string_insert(string(s), txt, 0);
	if(s < 10) txt = string_insert("0", txt, 0);
	txt = string_insert(" : ", txt, 0);
	txt = string_insert(string(m), txt, 0);
	if(m < 10) txt = string_insert("0", txt, 0);
	txt = string_insert(" : ", txt, 0);
	txt = string_insert(string(h), txt, 0);
	
	draw_set_color(c_black);
	draw_text(xx-offset,yy,txt);
	draw_text(xx+offset,yy,txt);
	draw_text(xx,yy-offset,txt);
	draw_text(xx,yy+offset,txt);
	draw_set_color(col);
	draw_text(xx,yy,txt);

	//Time
	if(oPlayer.playerControl){
		tutorial--;	
	}
	var alf = 255 - clamp(tutorial,0,255)
	
	xx = (getMarginX * 1);
	var yy = getHeight-marginY+58+alf;
	col = c_white;
	
	txt = "Move with the Arrow Keys and Rotate with 'Z' and 'X' ('M' to mute Music)\nGet more Points by Rescuing more Noops at the Same Time\nAnd Multiply those Points by Havinh Longer Stacks (Both can be seen on the top Left of the screen)";
	
	draw_set_color(c_black);
	draw_text(xx-offset,yy,txt);
	draw_text(xx+offset,yy,txt);
	draw_text(xx,yy-offset,txt);
	draw_text(xx,yy+offset,txt);
	draw_set_color(col);
	draw_text(xx,yy,txt);

#endregion



if(global.GameOver){
	gameOver = max(gameOver+0.01,1);
	draw_sprite_ext(sGameOver,-1,halfWidth,halfHeight,7,7,0,c_white,gameOver);
}

if(global.win){
	gameOver = max(gameOver+0.01,1);
	draw_sprite_ext(sThanks,-1,halfWidth,halfHeight,7,7,0,c_white,gameOver);
}

/*
#region //variaveis
	
	var avSize = getHalfWidth - (getMarginX*2) - 8; //test
	var quant = avSize div 8; //quantidade de cpartes
	var distance = quant*8; //quantidade correta de pixel entre as duas pontas	
	
	var xleft = getMarginX; // x da borda esquerda da caixa
	var xright = xleft + distance; //x da borda direita da caixa
	
	var yboth = getHeight - getMarginY; // y da caixa
	
	var xleftHealth = getHalfWidth + getMarginX; // x da borda esquerda health
	var xrightHealth = xleftHealth + distance; //x da borda direita da caixa
	
	var heatPer = global.heat/100; //heat
	var barLoc = xleft + (xright + scale_x - xleft)*heatPer + scale_x;
	
	var HealthPer = global.hp/100; //health
	var barLocHp = xleftHealth + (xrightHealth + scale_x - xleftHealth)*HealthPer + scale_x;
	
	var WHealthPer = whiteHP/100; //White health
	var WbarLocHp = xleftHealth + (xrightHealth + scale_x - xleftHealth)*WHealthPer + scale_x;
	
	var where = global.heatmark/100;
	var midle = (distance*where) + xleft; // calcular o meio exato da barra
	
	var healthcolor = make_colour_rgb(53, 255, 43);

#endregion
*/
