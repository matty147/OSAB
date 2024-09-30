var instance = instance_find(manager,0);

show_debug_message(instance.button);


image_index = 0;

if position_meeting(mouse_x,mouse_y,id)
{
	image_index = 1;
	if mouse_check_button(mb_left) ||  keyboard_check_released(vk_enter)
	{
		room_goto(level);	
	}
}else if button_id = instance.button
{
	image_index = 1;
	if keyboard_check_released(vk_enter)
	{
		room_goto(level);	
	}
}else image_index = 0;