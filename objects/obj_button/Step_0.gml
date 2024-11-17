// function

function button_pressed(menu_id, instance)
{
	if(global.can_interact){
		if scrollable
		{
			global.level_name = button_title;
			room_goto(level);
		}
	}
	
	instance.button = 0; 
	
	switch function_id
	{
		//first screen
	
			case "0": //start
				//room_goto(level); // level select screen
				instance.button = 5;
				return 1;
		
			case "1": // option
			//show_debug_message("show_options");
				return 2;
				
			case "10":
				global.pop_up = true;
				return;
		
			case "2": // credits
			//show_debug_message("show_credits");
				return 3;
		
			case "3": // quit
			game_end();
				break;

			case "4": // Back
				global.pop_up = false; // dosent find the room????
				//show_debug_message(menu_id/10);
				//return floor(menu_id/10);
	}
	return menu_id;
} 




var instance = instance_find(manager,0); //find manager object to fetch values

if keyboard_check_pressed(vk_escape) && instance.menu_id != 0 || keyboard_check_pressed(vk_backspace) && instance.menu_id != 0
{
	instance.menu_id = 4;// floor(instance.menu_id/10);
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


if position_meeting(mouse_x,mouse_y,id) && !instance.mouse_off
{
	image_index = 1;
	
	if mouse_check_button_released(mb_left)
	{
		audio_play_sound(snd_click, 2, false);
		instance.menu_id = button_pressed(instance.menu_id, instance);
		
	}

}else if button_id == instance.button && instance.mouse_off
{
	image_index = 1;
	if keyboard_check_released(vk_enter)
	{
		audio_play_sound(snd_click, 2, false);
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
			
			
		//saves the updated value from the list into a button_title.
		button_title = instance.save[instance.last_value];
		
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
			
		//saves the updated value from the list into a button_title.
		button_title = instance.save[instance.first_value];
		
	}
}

if(!global.can_interact){
	if(scrollable){
	image_xscale = 0.5;
	}
}


if move
{
	if global.pop_up
	{
		if hidden
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
}



//options buttons code

//fakt mě zabij tohle je stupidni to prenecham tobe
// Needs to move and spawn another object with settings info neer itself and reset whenever you leave that layer 

