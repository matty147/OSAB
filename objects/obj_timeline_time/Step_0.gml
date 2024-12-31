y = instance.y - instance.sprite_height * instance.numb_of_timelines - sprite_height;

if instance.hide
{
	y = room_height + sprite_height/2;
}

if keyboard_check_pressed(vk_space) && _manager.shortcuts_on
{
	play = !play;
}

if play
{
	offset++;
	//show_debug_message(offset);
}
 