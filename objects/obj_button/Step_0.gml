function button_pressed(menu_id)
{
	if scrollable
	{
		global.level_name = button_title;
		room_goto(level);
	}
	
	switch button_id
	{
		//first screen
	
			case "0": //start
				//room_goto(level); // level select screen
				return 1;
		
			case "1": // option
			//show_debug_message("show_options");
				return 2;

		
			case "2": // credits
			//show_debug_message("show_credits");
				return 3;
		
			case "3": // quit
			game_end();
				break;

			case "4": // Back
				return floor(menu_id/10);
	}
	return menu_id;
} 



var instance = instance_find(manager,0);

image_index = 0;

if position_meeting(mouse_x,mouse_y,id)
{
	instance.button = NaN;
	image_index = 1;
	if mouse_check_button_released(mb_left)
	{
		instance.menu_id = button_pressed(instance.menu_id);
	}

}else if button_id == instance.button
{
	image_index = 1;
	if keyboard_check_released(vk_enter)
	{
		instance.menu_id = button_pressed(instance.menu_id);
	}
}else image_index = 0;

//show_debug_message(instance.menu_id);

switch instance.menu_id
{
	
	case "0": //main menu
	instance_activate_layer("main");
	instance_deactivate_layer("options");
	instance_deactivate_layer("credits");
	instance_deactivate_layer("level_select");
		break;
	
	case "1": //level select
	instance_deactivate_layer("main");
	instance_deactivate_layer("options");
	instance_deactivate_layer("credits");
	instance_activate_layer("level_select");
		break;
	
	case "2":
	instance_deactivate_layer("main");
	instance_activate_layer("options");
	instance_deactivate_layer("credits");
	instance_deactivate_layer("level_select");
		break;
		
	case "3":
	instance_deactivate_layer("main");
	instance_deactivate_layer("options");
	instance_activate_layer("credits");
	instance_deactivate_layer("level_select");
		break;
}

if scrollable
{
	y = lerp(y, y + instance.move_buttons * 32,0.5);
	
	if y < - 30 // moving from top to bottom
	{
		y = y + room_height + 30;	
		
		
		//show_debug_message("instance.last_value: " + string(instance.last_value));
		//show_debug_message("replacing: " + string(button_title) + " with: " + string( instance.save[instance.last_value]));
		//show_debug_message("replacing: A");
		
			instance.last_value -= instance.move_buttons;
			instance.first_value -= instance.move_buttons;
		
			if instance.last_value < 0
			{
	
				instance.last_value = array_length(instance.save) - 1;
			}
			else if instance.last_value >= array_length(instance.save) -1
			{
				instance.last_value = 0;
			}
		button_title = instance.save[instance.last_value];
		
	}

	if y > room_height + 30 // moving from bottom to top
	{
		y = y - room_height - 30;
		//show_debug_message(instance.level_id)
		
		//show_debug_message("replacing: " + string(button_title) + " with: " + string( instance.save[instance.first_value]));
		//show_debug_message("replacing: B");
		
			instance.last_value -= instance.move_buttons;
			instance.first_value -= instance.move_buttons;
		
			if instance.first_value < 0
			{
	
				instance.first_value = array_length(instance.save) - 1;
			}
			else if instance.first_value >= array_length(instance.save)
			{
				instance.first_value = 0;
			}
		
		button_title = instance.save[instance.first_value];
		
		
	}
}