
if toggle
{
	x = mouse_x;
	y = mouse_y;
	
	if distance_to_object(obj_timeline_top) <= 0
	{
		y = (round((mouse_y - offset) / grid_size) * grid_size) + offset;	
	}
	//show_debug_message(y)
}

if keyboard_check_pressed(ord("B"))
{	
toggle = !toggle;	
}

if mouse_check_button_pressed(mb_left)
{
	start_point = mouse_x;
}

if mouse_check_button_released(mb_left)
{
	end_point = mouse_x;	
}