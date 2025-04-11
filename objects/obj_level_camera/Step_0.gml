if player.x < room_width / 2
{
	x_plan = 0;
}else if player.x > room_width / 2
{
	x_plan = room_width;
}

x = lerp(x,x_plan,0.15);