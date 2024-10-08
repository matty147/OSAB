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
first_value += move_buttons;
last_value += move_buttons;

//show_debug_message(move_buttons);
if first_value < 0
{
	
	first_value = array_length(save) - 1;
}else if first_value >= array_length(save)
{
	first_value = 0;
}

if last_value < 0
{
	
	last_value  = array_length(save) - 1;
}else if last_value  >= array_length(save)
{
	last_value  = 0;
}

//show_debug_message("first: " + string(first_value));
//show_debug_message("last: " + string(last_value));

move_buttons *= 32;