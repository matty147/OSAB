if !paused{
	//if keyboard_check_pressed(ord("N")) && _manager.shortcuts_on
	//{
	//	spawn_time = floor(random_range(0, 100));
	//	show_debug_message(spawn_time);
	//}
	
	if keyboard_check(vk_control) && !edit_menu_popup
	{
		if mouse_check_button_pressed(mb_left) && position_meeting(mouse_x,mouse_y,id)
		{
			dragging = true;
		}
	
		if mouse_check_button_released(mb_left)
		{
			dragging = false;
		
			if y < 100 //animation?
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
	
	
	}else if keyboard_check(vk_shift) && !edit_menu_popup
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
			//spawn_time = (5*(x - instance.x - 30) + (instance.offset * instance.distance)/2) / instance.distance;
			//spawn_time = floor(spawn_time);
			var x_in_timeline = mouse_x - instance.x + instance.offset;
			spawn_time = floor(x_in_timeline / instance.second_size) - 2;
			
		
		}
	}else if _manager.clickdouble == 2 && position_meeting(mouse_x,mouse_y,id) && !edit_menu_popup
	{
		edit_menu_popup = true;
		var edit_menu = instance_create_layer(x,y,"popups",obj_object_edit_menu); ///////////////////////////////////////////
		edit_menu.parent_id = id;
		edit_menu.image_xscale = 3.5;
		edit_menu.image_yscale = 6.25;	
		edit_menu.object_x = object_x;
		edit_menu.object_y = object_y;
		edit_menu.object_rotation = object_rotation % 360; // make the angle smaller or eaqual then 360
		edit_menu.object_x_scale = object_x_scale;
		//edit_menu.object_y_scale = object_y_scale;
		edit_menu.object_name = string(display_image);
		edit_menu.object_time = spawn_time;
		edit_menu.object_y_scale = object_speed; // temp 
		//show_debug_message("a");
	}

	if mouse_check_button_released(mb_left)
	{
		dragging = false;
	}
	
	var time_line = instance;  // todo rename instance

	// obj time -> x on timeline -> x on screen
	var x_in_timeline = (spawn_time + 2) * time_line.second_size;
	x = x_in_timeline - time_line.offset + time_line.x;

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
			
			if !place_meeting(x,y,obj_timeline_top) && x <= room_width && x >= instance.x && !bottom.hide
			{
				show_debug_message("sad")
				var top = instance_find(obj_timeline_top,0);
				y += top.sprite_height;
				last_position_y += top.sprite_height;
			}
	}

	if spawn_time < 0
	{
		spawn_time = 0;	
	}
}

if !bottom.hide && y > room_height
{
	y = room_height - instance.sprite_height;
}

if bottom.hide
{
	var timeline = instance_nearest(x, y, obj_timeline_top);
	y = timeline.y + sprite_height;	
}	

if mouse_check_button_pressed(mb_right) && position_meeting(mouse_x,mouse_y,id)
{
	extend = true;
}

if mouse_check_button_released(mb_right)
{
	extend = false;	
}

if extend // image_xscale = (mouse_x - x) / 32;
{	
	var x_in_timeline = mouse_x - x + instance.offset;
	var	drag_time = floor(x_in_timeline / instance.second_size);
	
	x_in_timeline = (drag_time) * instance.second_size;
	image_xscale = (x_in_timeline - instance.offset) / 32;
	
	show_debug_message(image_xscale);
	
	
	if image_xscale < min_object_stretch
	{
		image_xscale = min_object_stretch;
	}

	if mouse_x < x
	{
		image_xscale = 1;	
	}
	
	if duration < 0
	{
		duration = 0;	
	}	
}


//if global.runtime % 30 == 0
//{
//	show_debug_message("Moved Object: x_in_timeline=" + string(x_in_timeline) + "; x=" + string(x))
//
//}


// todo fix moving and makeing blocks longer