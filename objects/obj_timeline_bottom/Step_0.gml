numb_of_timelines += keyboard_check_pressed(vk_up) - keyboard_check_pressed(vk_down);

if numb_of_timelines < 0
{
	numb_of_timelines = 0;
}else if numb_of_timelines > max_numb_of_timelines
{
	numb_of_timelines = max_numb_of_timelines;	
}

if numb_of_timelines != last_numb_of_timelines && numb_of_timelines > last_numb_of_timelines
{
		var instance = instance_create_layer(x + 200,y - sprite_height * numb_of_timelines,"timeline",obj_timeline_top);
		instance.image_xscale = 18;
		instance = instance_create_layer(x,y - sprite_height * numb_of_timelines,"timeline",obj_timeline_name);
		instance.image_xscale = 3;
}

last_numb_of_timelines = numb_of_timelines;

if keyboard_check_pressed(ord("H"))
{	
	hide = !hide;
}

if hide 
{
	y = lerp(y, room_height + sprite_height,1);
	
}y = lerp(y, def_position_y,0.5);



//show_debug_message("a:" + string(numb_of_timelines));