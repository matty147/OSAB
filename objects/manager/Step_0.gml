if keyboard_check_released(ord("R")) && keyboard_check(vk_control)
{
	game_restart();	
}

//these will be buttons on the menu but for the time being they are here

if keyboard_check_pressed(ord("M")) && global.pause
{
	room_goto(main_menu);
}

if keyboard_check_pressed(ord("R")) && global.pause
{
	room_restart();
}

if room = level && keyboard_check_pressed(vk_escape)
{
	
global.pause = !global.pause;
	
}

if !global.pause
{
	global.runtime++;

	//show_debug_message(global.runtime);

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
