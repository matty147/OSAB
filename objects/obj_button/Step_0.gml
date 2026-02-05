// function

function button_pressed(menu_id, instance)
{
	if (scrollable)
	{
		global.level_name = file_path;
		show_debug_message(global.level_name);
		global.checkpoint = [0,0,0];
		global.pre_scoreboard_data = [];
		room_goto(level);
	}
	
	instance.button = 0; 
	
	show_debug_message(function_id);
	show_debug_message(menu_id);
	
	switch (function_id) // -1 is NaN
	{
		//first screen
	
			case "0": //start
				//room_goto(level); // level select screen
				instance.show_game_select_button = !instance.show_game_select_button;
				global.pop_up = !global.pop_up;
				instance.button = 5;
				return 5;
				
			case "5": //free mode
				instance.show_game_select_button = false;
				instance.button = 5;
				global.story_level = false;
				return 1;
				
			case "51": //fetch data
				var file_input = instance_find(obj_file_input,0);
				file_input.pressed_fetch = true;
				return -1;
				
			case "52": //post data
				var file_input = instance_find(obj_file_input,0);
				file_input.pressed_post = true;
				return -1;
				
			case "6": //story mode
				room_goto(level_select); // level select screen
				return -1;
		
			case "1": // option
			//show_debug_message("show_options");
			global.pop_up = false;
				return 2;
				
			case "2": // editor
			//show_debug_message("show_credits");
			audio_stop_all();
				return 3;
				
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

			case "23": // save
			//show_debug_message("show_credits");
				return 31;
				
			case "24": // load
				return 32;
		
			case "3": // quit
			game_end();
				break;

			case "4": // Back
				global.pop_up = false; // dosen't find the room????
				instance.show_game_select_button = false;
				show_debug_message(floor(menu_id/10));
				return floor(menu_id/10);
				
			case "40": // continue
				global.pause = false;
				return -1;
				
			case "41": // retry
			//show_debug_message("global level name" + string(global.level_name));
				audio_stop_all();
			
				if (!restart_from_checkpoint)
				{
					global.checkpoint = [0,0,0];
					global.pre_scoreboard_data = [];
				}else show_debug_message("starting from checkpoint");
			
				room_restart();
				return -1;
				
			case "42": // exit level or go to next level select
				audio_stop_all();
				if (global.story_level) 
				{
					room_goto(level_select);
				}else
				{
					room_goto(main_menu);
				}
				return -1;
				
			case "43": // exit level
				audio_stop_all();
				room_goto(main_menu);
				return -1;
				
			case "10":
				global.fullscreen = !global.fullscreen;
				window_set_fullscreen(global.fullscreen);
				return 20;
				
			case "11": // returning -1 may fuckup the back button 
				window_enable_borderless_fullscreen(false);
				return 20;
	}
	return menu_id;
} 

var instance = instance_find(manager,0); //find manager object to fetch values

if (keyboard_check_pressed(vk_escape) && instance.menu_id != 0 || keyboard_check_pressed(vk_backspace) && instance.menu_id != 0)
{
	global.pop_up = false;
	instance.show_game_select_button = false;
	instance.menu_id = floor(instance.menu_id/10);
	if (!audio_is_playing(snd_back))
	{
		audio_play_sound(snd_back, 2, false);
	}
}

image_index = 2;
 
// hide mouse when inactive
if (point_distance(instance.mouse_xprevious, instance.mouse_yprevious, mouse_x, mouse_y)) // if mouse is moving
{ 
	window_set_cursor(cr_default); //can make a 
	instance.mouse_off = false;
}
else if (alarm[0] <= 0)
{
	//alarm[0] = fps * 5; // mouse stoped moving for 3 s. alarm 0 will activate only when when 
}

instance.mouse_xprevious = mouse_x;
instance.mouse_yprevious = mouse_y;

if (instance.move_buttons != 0 &&  mouse_wheel_up() - mouse_wheel_down() == 0)
{
	alarm[0] = 1;	
}

if (instance_place(mouse_x,mouse_y - 32,obj_select_panel)) // the mouse is not perfect so we need to move it down a bit so there is no dead space
{
	can_interact = false;
}else can_interact = true;

if (can_interact && button_id != -1)
{
	instance.selected_scrollable_button = scrollable;
}else instance.selected_scrollable_button = false;

if (position_meeting(mouse_x,mouse_y,id) && !instance.mouse_off)
{
	
	if (!(scrollable && !can_interact)) // cant interact if button is hiden behind by obj_select_panel (mouse is touching select panel)
	{
		image_index = 1;
	
		instance.id_of_button_selected = selected_button_id;
	
		if (mouse_check_button_released(mb_left))
		{
			if (image_alpha > 0)
			{
				if (!audio_is_playing(snd_click))
				{	
					audio_play_sound(snd_click, 2, false);
				}
				instance.menu_id = button_pressed(instance.menu_id, instance);
			}
		}
	}

}else if (button_id == instance.button && instance.mouse_off)
{
	image_index = 1;
	
	instance.id_of_button_selected = selected_button_id;
	
	if (keyboard_check_released(vk_enter))
	{
		if (image_alpha > 0)
		{
			if (!audio_is_playing(snd_click))
			{
				audio_play_sound(snd_click, 2, false);
			}
			instance.menu_id = button_pressed(instance.menu_id, instance);
		}
	}
}

if (scrollable)
{
	
	if (position_meeting(mouse_x,mouse_y,id) && !instance.mouse_off)
	{
		image_xscale = 0.55;
	}else if (button_id == instance.button && instance.mouse_off)
	{
		image_xscale = 0.55;
	}else image_xscale = 0.5;

	//smooth moving from point A to point B
	y = lerp(y, y + instance.move_buttons * 32,0.5);
	
	if (y < - 30) // moving from top to bottom
	{
		y = y + room_height + 30;	
		
			instance.last_value -= sign(instance.move_buttons);
			instance.first_value -= sign(instance.move_buttons);
	
			//check if the list is not overflowing and if so, fix it. // isnt this basicly what clamp() does?
			if (instance.last_value < 0)
			{
				instance.last_value = array_length(instance.save) - 1;
			}
			else if (instance.last_value >= array_length(instance.save))
			{	
			instance.last_value = 0;
			}
			
			if (instance.first_value < 0)
			{
				instance.first_value = array_length(instance.save)-1;
			}
			else if (instance.first_value >= array_length(instance.save))
			{
				instance.first_value = 0;
			}
			
			selected_button_id = instance.last_value;
			
			//show_debug_message("a: " + string(instance.last_value));
			
		//saves the updated value from the list into a button_title.
		button_title = filename_name(instance.save[instance.last_value]);
		file_path = (instance.save[instance.last_value]);
	}

	if (y > room_height + 30) // moving from bottom to top
	{
		y = y - room_height - 30;
		
		
			instance.last_value -= sign(instance.move_buttons);
			instance.first_value -= sign(instance.move_buttons);	
			
			//check if the list is not overflowing and if so, fixes it.
			
			if (instance.first_value < 0)
			{
				instance.first_value = array_length(instance.save)-1;
			}
			else if (instance.first_value >= array_length(instance.save))
			{
				instance.first_value = 0;
			}
						
			if (instance.last_value < 0)
			{
				instance.last_value = array_length(instance.save) - 1;
			}
			else if (instance.last_value >= array_length(instance.save))
			{
				instance.last_value = 0;
			}
			
			selected_button_id = instance.first_value;
			//show_debug_message("a: " + string(instance.first_value));
			
		//saves the updated value from the list into a button_title.
		button_title = filename_name(instance.save[instance.first_value]); // use file_name to fetch file name from the path
		file_path = (instance.save[instance.first_value]);
		
	}
	button_title = string_replace(button_title,".osab","");
}

if(scrollable){
	image_xscale = 0.5;
	
	// var t = y - room_height / 2;
	// x = starting_x + t * t * 0.0001;

}

if (instance.menu_id == "0" || instance.menu_id == "5")
{
	instance.pop_up_id = 0;
}

if (move)
{
	if (global.pop_up || instance.show_game_select_button && instance.menu_id == 0)
	{
		if (hidden && instance.pop_up_id == button_number || hidden && instance.pop_up_id == 0)
		{
			display_text = true;
			image_alpha = clamp(image_alpha + 0.1, 0, 1);	
		}

		if (moved_position_x != -1)
		{
			x = lerp(x,moved_position_x + sprite_width,0.1);
		}
		
		if (moved_position_y != -1)
		{
			y = lerp(y,moved_position_y + sprite_height / 2,0.1);
		}
	}else
	{
		if (hidden)
		{
			display_text = false;
			image_alpha = clamp(image_alpha - 0.05, 0, 1);	
		}
		
		if (moved_position_x != -1)
		{
			x = lerp(x,original_x,0.1);
		}
		
		if (moved_position_y != -1)
		{
			y = lerp(y,original_y,0.1);
		}
	}
	
	if (instance.pop_up_id != button_number && button_number != 0)
	{
		image_alpha = clamp(image_alpha - 0.05, 0, 1);	
		display_text = false;	
	}
	
}

if (show_extra_buttons)
{
	if (instance.in_main_menu)
	{
		button_free_play.visible = true;
		button_story_mode.visible = true;
	}else
	{
		button_free_play.visible = false;
		button_story_mode.visible = false;
	}
}

var pannel = instance_find(obj_select_panel,0);