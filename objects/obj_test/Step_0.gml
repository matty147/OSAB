if !paused{
	if keyboard_check_pressed(ord("N"))
	{
		spawn_time = floor(random_range(0, 100));
		show_debug_message(spawn_time);
	}

	if keyboard_check(vk_control)
	{
		if mouse_check_button_pressed(mb_left) && position_meeting(mouse_x,mouse_y,id)
		{
			dragging = true;
		}
	
		if mouse_check_button_released(mb_left)
		{
			dragging = false;
		
			if y < 100
			{
				show_debug_message("deleted object");
				instance_destroy();	
			}
	
			if !dragging && !place_meeting(x,y,obj_timeline_top)
			{
				y = last_position_y;
			}else
			{
				last_position_y = y;
			}
		}
	
		if dragging && is_draggable
		{
			y = mouse_y;
		}
	
		if distance_to_object(obj_timeline_top) <= 0 && dragging
		{
			y = (round((mouse_y - offset) / grid_size) * grid_size) + offset;	
		
			if !place_meeting(x,y,obj_timeline_top)
			{
				y = mouse_y;	
			}
		}
	
	
	}else if keyboard_check(vk_shift)
	{
		if mouse_check_button_pressed(mb_left) && position_meeting(mouse_x,mouse_y,id)
		{
			dragging = true;
		}
	
		if mouse_check_button_released(mb_left)
		{
			dragging = false;
		}
	
		if dragging && is_draggable
		{
			x = mouse_x;
			spawn_time = (5*(x- instance.x - 30) + (instance.time * instance.distance)/2) / instance.distance;
			spawn_time = floor(spawn_time);
		}
	}else if _manager.clickdouble == 2 && position_meeting(mouse_x,mouse_y,id) && !edit_menu_popup
	{
		edit_menu_popup = true;
		var edit_menu = instance_create_layer(x,y,"manager",obj_object_edit_menu);
		edit_menu.parent_id = id;
		show_debug_message("a");
	}


	if mouse_check_button_released(mb_left)
	{
		dragging = false;
	}

	x = (instance.x + 30 + spawn_time * instance.distance / 5) - instance.time * instance.distance / 10;
	
	if !dragging
	{
		if x < instance.x
		{
			image_alpha = 0;
		}else if x > room_width
		{
				image_alpha = 0;
		}else image_alpha = 1;
	}
	
	if !dragging && !place_meeting(x,y,obj_timeline_top)
	{
			y = last_position_y;
	}

	if spawn_time < 0
	{
		spawn_time = 0;	
	}
}