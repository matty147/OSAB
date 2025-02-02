y = instance.y - instance.sprite_height * instance.numb_of_timelines - sprite_height;

if instance.hide
{
	y = room_height + sprite_height/2;
}

if keyboard_check_pressed(vk_space) && _manager.shortcuts_on
{
	play = !play;
	audio_stop_sound(sound_id);
	audio_play_sound(sound_id, 1, false,1,offset / 85 * 5,1);
}

if play
{
	offset += 85 / (fps * 4);
	//time++;
	//show_debug_message(offset);
}

if keyboard_check_pressed(vk_left) && _manager.shortcuts_on
{
	offset = 0;
}
 
 if keyboard_check_pressed(ord("G")) && _manager.shortcuts_on
{
		
	audio_stop_sound(sound_id);
	audio_play_sound(sound_id, 1, false,1,offset / 85 * 5,1);
	
}

 if keyboard_check_pressed(ord("M"))
{
	audio_stop_all();
}


//show_debug_message(offset)
//show_debug_message(offset / 85 * 5);