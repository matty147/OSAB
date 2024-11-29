// function

function button_pressed(menu_id, instance)
{
		if scrollable
		{
			global.level_name = button_title;
			room_goto(level);
		}

	
	instance.button = 0; 
	
	switch function_id // -1 is NaN
	{
		//first screen
	
			case "0": //start
				//room_goto(level); // level select screen
				instance.button = 5;
				return 1;
		
			case "1": // option
			//show_debug_message("show_options");
			global.pop_up = false;
				return 2;
				
			case "20":
				global.pop_up = true;
				instance.pop_up_id = 1;
				return 20;
				
			case "21":
				global.pop_up = true;
				instance.pop_up_id = 2;
				return 21;
				
			case "22":
				global.pop_up = true;
				instance.pop_up_id = 3;
				return 22;
				
			case "2": // credits
			//show_debug_message("show_credits");
				return 3;
		
			case "3": // quit
			game_end();
				break;

			case "4": // Back
				global.pop_up = false; // dosen't find the room????
				show_debug_message(menu_id/10);
				return floor(menu_id/10);
				
			case "40": // continue
				global.pause = false;
				return 0;
				
			case "41": // retry
			//show_debug_message("global level name" + string(global.level_name));
				room_restart();
				return 0;
				
			case "42": // exit level
				room_goto(main_menu)
				return 0;
				
	}
	return menu_id;
} 

var instance = instance_find(manager,0); //find manager object to fetch values

if keyboard_check_pressed(vk_escape) && instance.menu_id != 0 || keyboard_check_pressed(vk_backspace) && instance.menu_id != 0
{
	pop_up = false;
	instance.menu_id = floor(instance.menu_id/10);
	audio_play_sound(snd_back, 2, false);
}


if button_id % 2 == 0 && scrollable
{
	image_index = 2;	
}else image_index = 2; //0
 
// hide mouse when inactive
if point_distance(instance.mouse_xprevious, instance.mouse_yprevious, mouse_x, mouse_y) // if mouse is moving
{ 
	window_set_cursor(cr_default); //can make a 
	instance.mouse_off = false;
}
else if alarm[0] <= 0
{
	//alarm[0] = fps * 5; // mouse stoped moving for 3 s. alarm 0 will activate only when when 
}

instance.mouse_xprevious = mouse_x;
instance.mouse_yprevious = mouse_y;

if instance.move_buttons != 0 &&  mouse_wheel_up() - mouse_wheel_down() == 0
{
	alarm[0] = 1;	
}

if instance_place(mouse_x,mouse_y - 32,obj_select_panel) // the mouse is not perfect so we need to move it down a bit so there is no dead space
{
	can_interact = false;
}else can_interact = true;

if position_meeting(mouse_x,mouse_y,id) && !instance.mouse_off 
{
	if !(scrollable && !can_interact) // cant interact if button is hiden behind by obj_select_panel (mouse is touching select panel)
	{
		image_index = 1;
	
		instance.id_of_button_selected = selected_button_id;
	
		if mouse_check_button_released(mb_left)
		{
			if image_alpha > 0
			{
				audio_play_sound(snd_click, 2, false);
			}
			instance.menu_id = button_pressed(instance.menu_id, instance);
		}
	}

}else if button_id == instance.button && instance.mouse_off
{
	image_index = 1;
	
	instance.id_of_button_selected = selected_button_id;
	
	if keyboard_check_released(vk_enter)
	{
		if image_alpha > 0
		{
			audio_play_sound(snd_click, 2, false);
		}
		instance.menu_id = button_pressed(instance.menu_id, instance);
	}
}

if scrollable
{
	
	if position_meeting(mouse_x,mouse_y,id) && !instance.mouse_off
	{
		image_xscale = 0.55;
	}else if button_id == instance.button && instance.mouse_off
	{
		image_xscale = 0.55;
	}else image_xscale = 0.5;
}


if scrollable
{
	//smooth moving from point A to point B
	y = lerp(y, y + instance.move_buttons * 32,0.5);
	
	if y < - 30 // moving from top to bottom
	{
		y = y + room_height + 30;	
		
			instance.last_value -= sign(instance.move_buttons);
			instance.first_value -= sign(instance.move_buttons);
		
		
		
			//check if the list is not overflowing and if so, fixes it.
		
			if instance.last_value < 0
			{
				instance.last_value = array_length(instance.save) - 1;
			}
			else if instance.last_value >= array_length(instance.save)
			{	
			instance.last_value = 0;
			}
			
			if instance.first_value < 0
			{
				instance.first_value = array_length(instance.save)-1;
			}
			else if instance.first_value >= array_length(instance.save)
			{
				instance.first_value = 0;
			}
			
			selected_button_id = instance.last_value;
			
			//show_debug_message("a: " + string(instance.last_value));
			
		//saves the updated value from the list into a button_title.
		button_title = filename_name(instance.save[instance.last_value]);
		
	}

	if y > room_height + 30 // moving from bottom to top
	{
		y = y - room_height - 30;
		
		
			instance.last_value -= sign(instance.move_buttons);
			instance.first_value -= sign(instance.move_buttons);	
			
			//check if the list is not overflowing and if so, fixes it.
			
			if instance.first_value < 0
			{
				instance.first_value = array_length(instance.save)-1;
			}
			else if instance.first_value >= array_length(instance.save)
			{
				instance.first_value = 0;
			}
						
			if instance.last_value < 0
			{
				instance.last_value = array_length(instance.save) - 1;
			}
			else if instance.last_value >= array_length(instance.save)
			{
				instance.last_value = 0;
			}
			
			selected_button_id = instance.first_value;
			//show_debug_message("a: " + string(instance.first_value));
			
		//saves the updated value from the list into a button_title.
		button_title = filename_name(instance.save[instance.first_value]); // use file_name to fetch file name from the path
		
	}
}

	if(scrollable){
		image_xscale = 0.5;
	}


if move
{
	if global.pop_up
	{
		if hidden && instance.pop_up_id == button_number || hidden && instance.pop_up_id == 0
		{
			display_text = true;
			image_alpha = clamp(image_alpha + 0.1, 0, 1);	
		}

		x = lerp(x,moved_position_x + sprite_width,0.1);
	}else
	{
		if hidden
		{
			display_text = false;
			image_alpha = clamp(image_alpha - 0.05, 0, 1);	
		}
		
		x = lerp(x,original_x,0.1);
	}
	
	if instance.pop_up_id != button_number && button_number != 0
	{
		image_alpha = clamp(image_alpha - 0.05, 0, 1);	
		display_text = false;	
	}
	
}

var pannel = instance_find(obj_select_panel,0);