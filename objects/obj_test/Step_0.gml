
if toggle
{
	x = mouse_x;
	y = mouse_y;
	
	if distance_to_object(obj_timeline_top) < 10
	{

		// Grid size
		var grid_size = 64;
		y = (round(mouse_y / grid_size) * grid_size);	
	
	}
}

if keyboard_check_pressed(ord("B"))
{	
toggle = !toggle;	
}