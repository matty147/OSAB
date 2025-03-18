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

if mouse_wheel_down() || mouse_wheel_up()
{
	audio_stop_sound(sound_id);	
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
	audio_stop_sound(sound_id);
	offset = 0;
}
 
//play audio at certain point
if keyboard_check_pressed(ord("G")) && _manager.shortcuts_on
{
		
	//audio_stop_sound(sound_id);
	audio_play_sound(sound_id, 1, false,1,(offset / distance * 5),1);
	
}

// stop all sounds 
if keyboard_check_pressed(ord("M")) && _manager.shortcuts_on
{
	audio_stop_all();
}

if keyboard_check(vk_control) && keyboard_check_pressed(ord("L"))
{
	var audio_path = get_open_filename(".ogg|*.ogg","");
	if audio_path != -1
	{
		show_debug_message("created new audio");
		sound_id = audio_create_stream(audio_path);
	}
}
