global.runtime++;

//show_debug_message(global.runtime);

if keyboard_check_released(ord("R"))
{
	game_restart();	
}

if keyboard_check_pressed(vk_escape)
{
	game_end();	
}
	
	button += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	
	if button > button_max
	{
		button = button_max;
	}else if button < 0
	{
		button = 0;	
	}

move_buttons = mouse_wheel_up() - mouse_wheel_down();
level_id += move_buttons;

//show_debug_message(move_buttons);
if level_id < 0
{
	
	level_id = array_length(save) - 1;
}else if level_id >= array_length(save)
{
	level_id = 0;
}

move_buttons *= 32;