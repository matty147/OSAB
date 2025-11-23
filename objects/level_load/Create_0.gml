audio_master_gain(global.volume);
audio_stop_all();

current_index = 0;
win = false;

read_file = false;

end_game = 250;

player = instance_find(obj_player,0);

	//load file
	
	level_data = undefined;
	
	if (file_exists(global.level_name))
	{
	
		var json = "";
	
		var file = file_text_open_read(global.level_name);
	
		while(file_text_eof(file) == false)
		{
			json += file_text_readln(file);
		}
		
		file_text_close(file);

		
		level_data = json_parse(json);
	
	}
	
	meta = level_data.meta;
	objects = level_data.level;
	
	show_debug_message(meta.id);
	show_debug_message(meta.name);
	show_debug_message(meta.description);
	show_debug_message(meta.lenght);
	show_debug_message(meta.diff);
	
	show_debug_message($"aaa {objects[0]}");
	
	show_debug_message("finished");
	read_file = true;
	
	show_debug_message("object count: " + string(array_length(objects)));
	
	if (array_length(objects) <= 0)
	{
		show_message("Error: This level contains no content! Returning to the main menu.");
		room_goto(main_menu);
	}
	
	var path = filename_dir(global.level_name) + "\\*.ogg";
	//var path = folder + "\\*";

	show_debug_message(path);
	
	search = file_find_first(path, fa_directory);
	file_find_close();
	
	show_debug_message("found song: " + string(search));

	if (search != "")
	{
		pitch = 1.0;
		sound_id = audio_create_stream(filename_dir(global.level_name) + "\\" + search);
	}

	show_debug_message("glob: " + (string(global.cleared) + "(level_load)"));
	show_debug_message("stor: " + (string(global.story_level) + "(level_load)"));
	
	audio_deleted = 0;