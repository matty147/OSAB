function button_pressed()
{
	switch button_id
	{
	
	case "0": //start
		room_goto(level);
		break;
		
	case "1": // option
	show_message("show_options");
		break;
		
	case "2": // system
	show_message("show_system");
		break;
		
	case "3": // quit
	game_end();
		break;
	
	}
} 



var instance = instance_find(manager,0);

show_debug_message(instance.button);


image_index = 0;

if position_meeting(mouse_x,mouse_y,id)
{
	instance.button = instance.button_max + 1;
	image_index = 1;
	if mouse_check_button(mb_left) ||  keyboard_check_released(vk_enter)
	{
		button_pressed();
	}

}else if button_id = instance.button
{
	image_index = 1;
	if keyboard_check_released(vk_enter)
	{
		button_pressed();
	}
}else image_index = 0;