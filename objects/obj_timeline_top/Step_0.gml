if timeline_number > instance.numb_of_timelines
{
	show_debug_message("i dieded");
	instance_destroy();
}

if instance.hide
{
	y = lerp(y, room_height + sprite_height * 6,1);
	
}y = lerp(y, def_position_y,0.5);


 