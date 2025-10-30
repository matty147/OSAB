/// @description (depricated DO NOT USE) loads the data into the editors. Returns two arrays, the first one being the object description and the second one being the objects
/// @return {array[array,array]} 
function scr_load_level_old(){ //, time, id, x, y, scale, direction, speed, alpha
	
	var file_location = get_open_filename(".osab|*.osab","");
	
	if file_location != -1{} //closes the app so a crash wont happen
	
	var file = file_text_open_read(file_location);
	var level_data = []; // level info
	var object_data = []; // level objects
	
	
	while (!file_text_eof(file)) {
		var line = file_text_readln(file);
		//show_debug_message("line: " + string(line));
		
		if string_trim(line) != ""
		{
			var object = string_split(line, ",");

			//show_debug_message(object);
		
			if object[0] != "id" && object[0] != "name" && object[0] != "lenght" && object[0] != "diff" && object[0] != "description" && string_trim(object[0]) != "-"
			{
				//save file into arrays
				//show_debug_message("a: " + string(_path_parts[0]));
				
					if object[0] != "//" // removes comments. comments must start with "//,"
					{
						if array_length(object) >= 9
						{
							array_push(object_data,[
							object[0], 
							object[1],
							object[2],
							object[3],
							object[4],
							object[5],
							object[6],
							object[7],
							object[8]]);
						}else
						{
							array_push(object_data,[
							object[0], 
							object[1],
							object[2],
							object[3],
							object[4],
							object[5],
							object[6],
							object[7],
							"2"]);
						}
						
						//show_debug_message(object);
					}else show_debug_message("comment: " + string(line));
			}else
			{
				//show_debug_message(object[0]);
				if string_trim(object[0]) != "-"
				{
					array_push(level_data,object[1]);
				}else show_debug_message("dash")
			}
		}else show_debug_message("nothing here line ignored");
	}
	
		show_debug_message(object_data);
		show_debug_message("");
		show_debug_message(level_data);
        file_text_close(file); // Close the file
		
		return [level_data,object_data];
}