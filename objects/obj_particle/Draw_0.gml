
draw_sprite_general(sprite,0,left,top,width,height,x,y,scale,scale,dir,c_white,c_white,c_white,c_white,alpha);
speed -= 0.1;
if (speed < 0)
{
	speed = 0;	
}

if (x>room_width) || (x < 0) || (y > room_height) || (survive_time <= 0)
{
	alpha -= 0.025;
	// scale -= 0.05;
}survive_time--;

// show_debug_message(alpha);

if (alpha <=0)
{
    instance_destroy();
}