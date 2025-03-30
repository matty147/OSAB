	if floor(global.runtime) == 0  && search != ""
	{
		if !audio_is_playing(sound_id)
		{
			show_debug_message("playing sound");
			audio_play_sound(sound_id, 1, false,1);
		}
		
	}
	
	if global.runtime > 1 && search != ""
	{
	
		if global.pause
		{
			audio_pause_sound(sound_id);
		}else 
		{
			if audio_is_paused(sound_id)
			{
				audio_resume_sound(sound_id);
			}
		}
	}
	
	// spawn objects after the file is read until there are no more to spawn
	if current_index < array_length(_x) && _time[current_index] == floor(global.runtime)
	{
		//show_debug_message(global.runtime);
		//show_debug_message(duration[current_index]);
		var instance = instance_create_layer(_x[current_index],_y[current_index],"spawned",obj_enemy);
		//instance.image_index = 0;
		instance.object_sprite = _id[current_index];
		instance.image_xscale = _size[current_index];
		instance.image_yscale = _size[current_index];
		instance.angle = _angle[current_index];
		instance._speed = _speed[current_index];
		instance.image_alpha = _alpha[current_index];
		instance.survive_speed = real(duration[current_index]) * 85;
		instance.move = true;
		
		//show_debug_message(_time[current_index + 1]);
		
		//show_debug_message(instance.level_object_list[_id[current_index]]);
		current_index++;
	
	
		//spawning enemies on the same frame
		while current_index < array_length(_x) && _time[current_index] == floor(global.runtime)
		{
			//show_debug_message(global.runtime);
			//show_debug_message(duration[current_index]);
			instance = instance_create_layer(_x[current_index],_y[current_index],"spawned",obj_enemy);
			//instance.image_index = 0;
			instance.object_sprite = _id[current_index];
			instance.image_xscale = _size[current_index];
			instance.image_yscale = _size[current_index];
			instance.angle = _angle[current_index];
			instance._speed = _speed[current_index];
			instance.image_alpha = _alpha[current_index];
			instance.survive_speed = real(duration[current_index]) * 85;
			instance.move = true;
			
			//show_debug_message(instance.level_object_list[_id[current_index]]);
			current_index++;	

			show_debug_message(_time[current_index + 1]);
		}
	}
	
	if _time[array_length(_x) - 1] >= floor(global.runtime)
	{
		end_game = 250;
	}else end_game--;
	
	if end_game = 249 && search != ""
	{
		audio_sound_gain(sound_id,0,7000);	
	}
	
	if  player.dead && search != ""
	{
		pitch -= 0.01;
		audio_sound_pitch(sound_id, pitch);
		
		if pitch < 0
		{
			audio_stop_sound(sound_id);
		}
	}

	if instance_number(obj_enemy) <= 0 && end_game < 0
	{
		win = true;
		global.pause = true;
		
		if !global.cleared && global.story_level
		{
			show_debug_message("cleared + story" + string(global.cleared_levels));
			global.cleared_levels++;
			global.cleared = true;
			show_debug_message("cleared + story" + string(global.cleared_levels));
			
			if search != ""
			{
				audio_stop_sound(sound_id);
			}
		}
		//room_goto(main_menu);
		//game_end();	
	}
	
//	show_debug_message(global.runtime)