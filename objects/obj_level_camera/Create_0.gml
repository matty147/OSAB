player = instance_find(obj_level_player,0);

if player.x < 1135
{	
	x = 0;
	
}else if  player.x > 800
{
	x = room_width;	
}

x_plan = x;
make_leap = false;
camera_width = 1366;
move = false;

