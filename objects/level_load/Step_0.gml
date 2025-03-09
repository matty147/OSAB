	// spawn objects after the file is read until there are no more to spawn
	if current_index < array_length(_x) && _time[current_index] == floor(global.runtime)
	{
		var instance = instance_create_layer(_x[current_index],_y[current_index],"spawned",obj_enemy);
		//instance.image_index = 0;
		instance.object_sprite = _id[current_index];
		instance.image_xscale = _size[current_index];
		instance.image_yscale = _size[current_index];
		instance.angle = _angle[current_index];
		instance._speed = _speed[current_index];
		instance.image_alpha = _alpha[current_index];
		instance.survive_speed = 500;
		instance.move = true;
		
		//show_debug_message(instance.level_object_list[_id[current_index]]);
		current_index++;
	
	
		//spawning enemies on the same frame
		while current_index < array_length(_x) && _time[current_index] == floor(global.runtime)
		{
			instance = instance_create_layer(_x[current_index],_y[current_index],"spawned",obj_enemy);
			//instance.image_index = 0;
			instance.object_sprite = _id[current_index];
			instance.image_xscale = _size[current_index];
			instance.image_yscale = _size[current_index];
			instance.angle = _angle[current_index];
			instance._speed = _speed[current_index];
			instance.image_alpha = _alpha[current_index];
			instance.survive_speed = 500;
			instance.move = true;
			
			//show_debug_message(instance.level_object_list[_id[current_index]]);
			current_index++;	

		}
	}

	if _time[array_length(_x) - 1] >= floor(global.runtime)
	{
		end_game = 250;
	}else end_game--;

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
		}
		//room_goto(main_menu);
		//game_end();	
	}
	
//	show_debug_message(global.runtime)