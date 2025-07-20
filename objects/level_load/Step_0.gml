	if floor(global.runtime) == 0  && search != ""
	{
		if !audio_is_playing(sound_id)
		{
			show_debug_message("playing sound");
			audio_play_sound(sound_id, 1, false,1);
		}
		
	}
	
	if global.runtime > 1 && search != "" && !win
	{
	
		if global.pause && !player.dead
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
	
	//spawning enemies on the same frame
	while current_index < array_length(objects) && objects[current_index].time == floor(global.runtime)
	{
			
		var position = objects[current_index].position;
		var size = objects[current_index].size;
		var move = objects[current_index].move;
			
		var instance = instance_create_layer(position[0],position[1],"spawned",obj_enemy);
		
		instance.object_sprite = objects[current_index].object_type;
		instance.image_xscale = size[0];
		instance.image_yscale = size[1];
		instance.angle = objects[current_index].angle;
		instance._speed = move.speed;
		instance.image_alpha = move.alpha;
		instance.survive_speed = real(move.duration) * 85;
		instance.move = true; //????
		instance.show_hitbox = real(move.show_hitbox);
		 
		instance.move_type = variable_struct_exists(move, "move_type") ? move.move_type : "None";	
		instance.positions = variable_struct_exists(move, "positions") ? move.positions : [];
		instance.bounce = variable_struct_exists(move, "bounce") ? move.bounce: [0,0]; 
		instance._gravity = variable_struct_exists(move, "gravity") ? move.gravity: 0;
		instance.splines = variable_struct_exists(move, "spline") ? move.spline: false;
		instance._friction = variable_struct_exists(move, "friction") ? move.friction: false;
		instance.end_scale = variable_struct_exists(move, "end_scale") ? move.end_scale: [size[0],size[1]];
		instance.scale_speed = variable_struct_exists(move, "end_scale") ? move.scale_speed: [move.speed,move.speed];

		current_index++;
	}
	
	if floor(global.runtime) <= objects[array_length(objects) - 1].time && !instance_exists(obj_enemy)
	{
		end_game = 250;
	}else if !global.pause
	{	
		end_game--;
	}
	
	if end_game = 249 && search != ""
	{
		audio_sound_gain(sound_id,0,7000);	
	}
	
	if player.dead && search != ""
	{
		show_debug_message(pitch);
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
		
		if search != ""
		{
			audio_stop_sound(sound_id);
			if audio_deleted
			{
				audio_deleted = audio_destroy_stream(sound_id);
			}
		}
		
		if !global.cleared && global.story_level
		{
			show_debug_message("cleared + story" + string(global.cleared_levels));
			global.cleared_levels++;
			global.cleared = true;
			show_debug_message("cleared + story" + string(global.cleared_levels));
		}
		//room_goto(main_menu);
		//game_end();	
	}
	
//	show_debug_message(global.runtime)