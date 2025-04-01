current_index = 0;
win = false;

read_file = false;

end_game = 0;

player = instance_find(obj_player,0);

_time = [];
_id = [];
_x = [];
_y = [];
_size = [];
_angle = [];
_speed = [];
_alpha = [];
duration = [];

	//load file
	file = file_text_open_read(global.level_name);
	
	show_debug_message(global.level_name);
	
	//read file
	while (!file_text_eof(file)) {
		line = file_text_readln(file);
		show_debug_message("line: " + string(line));
		
		if string_trim(line) != ""
		{
			_path_parts = string_split(line, ",");

			show_debug_message(_path_parts);
		
			if _path_parts[0] != "id" && _path_parts[0] != "name" && _path_parts[0] != "lenght" && _path_parts[0] != "diff" && _path_parts[0] != "description" && string_trim(_path_parts[0]) != "-"
			{
				//save file into arrays
				//show_debug_message("a: " + string(_path_parts[0]));
					if _path_parts[0] != "//" // removes comments. comments must start with "//,"
					{
						array_push(_time,_path_parts[0]);		
						array_push(_id,_path_parts[1]);
						array_push(_x,_path_parts[2]);
						array_push(_y,_path_parts[3]);
						array_push(_size,_path_parts[4]);
						array_push(_angle, _path_parts[5]);
						array_push(_speed, _path_parts[6]);
						array_push(_alpha, _path_parts[7]);
						if array_length(_path_parts) >= 9
						{
							if string_trim(string(_path_parts[8])) != ""
							{
								array_push(duration, _path_parts[8]);
							}else array_push(duration, 2);
						}else array_push(duration, 2);
					}else show_debug_message("comment " + string(line));
			}//else show_debug_message("level : " + string(_path_parts[0]) + ": " + string (_path_parts[1]));
		}else show_debug_message("nothing here line ignored");
		
		//show_debug_message(line);
		
		//show_debug_message("time:" + string(_path_parts[0]) + " id: " + string(_path_parts[1]));
		//show_debug_message("x:" + string(_path_parts[2]) + " y: " + string(_path_parts[3]));
		
		//show_debug_message("-----------------------------------------------------------------")
		//show_debug_message("-----------------------------------------------------------------")
		//show_debug_message("-----------------------------------------------------------------")
	}
	file_text_close(file);
	show_debug_message("finished");
	read_file = true;
	
	if array_length(_x) <= 0
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

	if search != ""
	{
		pitch = 1.0;
		sound_id = audio_create_stream(filename_dir(global.level_name) + "\\" + search);
	}

	show_debug_message("glob: " + (string(global.cleared) + "(level_load)"));
	show_debug_message("stor: " + (string(global.story_level) + "(level_load)"));
	
	audio_deleted = 0;