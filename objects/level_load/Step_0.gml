
all_playes_dead = true;

for (var pl = 0; pl < instance_number(obj_player);pl++)
{
	var check_player = instance_find(obj_player,pl);
	
	if (!check_player.dead)
	{
		all_playes_dead = false;
	}
}

if (all_playes_dead)
{
	global.pause = true;
}

if (floor(global.runtime) == 0  && search != "")
{
	if (!audio_is_playing(sound_id))
	{
		show_debug_message("playing sound");
		audio_play_sound(sound_id, 1, false,1);
	}
}

if (global.runtime > 1 && search != "" && !win)
{
	if (global.pause && !all_playes_dead)
	{
		audio_pause_sound(sound_id);
	}else 
	{
		if (audio_is_paused(sound_id))
		{
			audio_resume_sound(sound_id);
		}
	}
}

if (array_length(meta.checkpoints) > current_checkpoint_index)
{
	
	if (array_length(meta.checkpoints) > 0 && floor(meta.checkpoints[current_checkpoint_index]) == floor(global.runtime))
	{
		// show_debug_message($"checkpoint!!! {meta.checkpoints[current_checkpoint_index]}");
		
		var checkpoint = instance_create_layer(x,y,"main",obj_level_checkpoint);
		
		for (var obj = 0; obj < array_length(objects); obj++)
		{
			// show_debug_message($"now checking object {objects[obj].time} with the id {obj}");
			
			if (meta.checkpoints[current_checkpoint_index] <= objects[obj].time)
			{
				// show_debug_message($"this is the nearest object{objects[obj].time} at id: {obj}");
				global.checkpoint = [objects[obj].time, obj, current_checkpoint_index + 1]; // time, obj index
				global.pre_scoreboard_data = obj_points_scoreboard_manager.player_stats;
				
				// show_debug_message($"{global.pre_scoreboard_data} vs {obj_points_scoreboard_manager.player_stats}");
				// show_debug_message($"{json_encode(global.pre_scoreboard_data[0])} vs {json_encode(obj_points_scoreboard_manager.player_stats[0])}");
				
				break;
			}
		}
		
		current_checkpoint_index++;
		
		show_debug_message(current_checkpoint_index);
	}
}

//spawning enemies on the same frame
while (current_index < array_length(objects) && objects[current_index].time == floor(global.runtime))
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

if (!global.pause)
{
	level_length++;
}

if (global.runtime <= objects[array_length(objects) - 1].time || instance_exists(obj_enemy))
{
	end_game = 250;
}else if (!global.pause)
{	
	end_game--;
}

if (end_game <= 240 && search != "")
{
	audio_sound_gain(sound_id,0,1000);	
	with (obj_player) {collect_points = false;}
	
	if (obj_points_scoreboard_manager.level_length  == -1)
	{
		obj_points_scoreboard_manager.level_length  = level_length  + 241; // we need to add the endgame timer
	}
}

if (all_playes_dead && search != "")
{
	pitch = clamp(pitch - 0.01,0, pitch);
	
	audio_sound_pitch(sound_id, pitch);
	
	if (pitch < 0)
	{
		audio_stop_sound(sound_id);
	}
	
	for (var l = 0; l < array_length(global.gamepads);l++)
{
	var controller = global.gamepads[l];
	
	gamepad_set_vibration(controller,0,0);
}

}

if (instance_number(obj_enemy) <= 0 && end_game < 0)
{
	if (player_amount > 0 && !already_shown_score_board)
	{
		scoreboard_manager.score_board_display_time = default_scoreboard_display_time;
		already_shown_score_board = true;
	}if (!global.pause)
	{
		scoreboard_manager.score_board_display_time--;
	}
	
	if (scoreboard_manager.score_board_display_time <= 0)
	{
		win = true;
		
		global.pause = true;
	
		if (search != "")
		{
			audio_stop_sound(sound_id);
			if (audio_deleted)
			{
				audio_deleted = audio_destroy_stream(sound_id);
			}
		}
		
		if (!global.cleared && global.story_level)
		{
			show_debug_message("cleared + story" + string(global.cleared_levels));
			global.cleared_levels++;
			global.cleared = true;
			show_debug_message("cleared + story" + string(global.cleared_levels));
		}
	}
}
	
//	show_debug_message(global.runtime)