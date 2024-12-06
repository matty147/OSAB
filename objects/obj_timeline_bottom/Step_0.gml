numb_of_timelines += keyboard_check_pressed(vk_up) - keyboard_check_pressed(vk_down);

if numb_of_timelines < 0
{
	numb_of_timelines = 0;
}else if numb_of_timelines > max_numb_of_timelines
{
	numb_of_timelines = max_numb_of_timelines;	
}

show_debug_message("a:" + string(numb_of_timelines));