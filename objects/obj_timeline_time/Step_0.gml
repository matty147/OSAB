// calculate position

y = instance.y - instance.sprite_height * instance.numb_of_timelines - sprite_height;

if instance.hide
{
	y = room_height + sprite_height/2;
}

// pause / play 
if keyboard_check_pressed(vk_space) && _manager.shortcuts_on
{
	play = !play;
	
}

// start time
if play
{
	if !audio_is_playing(sound_id) // plays the sound only when its not playing
	{
		audio_play_sound(sound_id, 1, false,1,(offset / distance * 5),1);
	}
	offset += distance / (5 * room_speed);
}else audio_stop_sound(sound_id);


//reset offset
if keyboard_check_pressed(vk_left) && _manager.shortcuts_on
{
	offset = 0;
}
 
//play audio at certain point
if keyboard_check_pressed(ord("G")) && _manager.shortcuts_on
{
		
	//audio_stop_sound(sound_id);
	audio_play_sound(sound_id, 1, false,1,(offset / distance * 5),1);
	
}

// stop all sounds 
if keyboard_check_pressed(ord("M"))
{
	audio_stop_all();
}

// show audio debug menu
if keyboard_check_pressed(ord("A"))
{
	audio_debug(true);
}
