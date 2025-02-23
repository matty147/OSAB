 if _manager.shortcuts_on && !hide
 {
	numb_of_timelines += keyboard_check_pressed(vk_up) - keyboard_check_pressed(vk_down);
 }

if numb_of_timelines < min_numb_of_timelines
{
	numb_of_timelines = min_numb_of_timelines;
}else if numb_of_timelines > max_numb_of_timelines
{
	numb_of_timelines = max_numb_of_timelines;	
}

if numb_of_timelines != last_numb_of_timelines && numb_of_timelines > last_numb_of_timelines && !hide
{
		var instance = instance_create_layer(x + 192,y - sprite_height * numb_of_timelines,"timeline",obj_timeline_top);
		instance.image_xscale = 19;
		instance = instance_create_layer(x,y - sprite_height * numb_of_timelines,"timeline",obj_timeline_name);
		instance.image_xscale = 3;
}

last_numb_of_timelines = numb_of_timelines;

if keyboard_check_pressed(ord("H")) && _manager.shortcuts_on
{	
	hide = !hide;
}

if hide 
{
	y = lerp(y, room_height + sprite_height,1);
	
}y = lerp(y, def_position_y,0.5);


if keyboard_check_pressed(ord("C")) && _manager.shortcuts_on
{
	show_checkerboard = !show_checkerboard;
}

if keyboard_check_pressed(ord("X")) && _manager.shortcuts_on
{
	help_line = !help_line;
}



//show_debug_message("a:" + string(numb_of_timelines));