global.runtime++;

//show_debug_message(global.runtime);


if keyboard_check_released(ord("R"))
{
	game_restart();	
}

if keyboard_check_pressed(vk_escape)
{
	game_end();	
}

//
if keyboard_check_pressed(ord("G"))
{
	//reset arrays
	_time = [];
	_id = [];
	_x = [];
	_y = [];
	
	//load file
	var file = file_text_open_read("test.txt");

	//read file
	while (!file_text_eof(file)) {
		var line = file_text_readln(file);
		
		var _path_parts = string_split(line, ",");

		show_debug_message(_path_parts);

		//save file into arrays
		array_push(_time,_path_parts[0]);
		array_push(_id,_path_parts[1]);
		array_push(_x,_path_parts[2]);
		array_push(_y,_path_parts[3]);
		array_push(_size,_path_parts[4]);
		//_y = array_last(_path_parts);
		
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
}	



// spawn objects after the file is read until there are no more to spawn
if read_file && current_index < array_length(_x)
{
	var instance = instance_create_layer(_x[current_index],_y[current_index],"Spawned",obj_enemy);
	instance.image_index = _id[current_index];
	instance.image_xscale = _size[current_index];
	instance.image_yscale = _size[current_index];
	current_index++;
} 