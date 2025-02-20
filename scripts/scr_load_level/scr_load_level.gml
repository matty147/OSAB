/// @description loads the data into the editors
/// @param a a
function scr_load_level(){
	var file_location = get_open_filename(".osab|*.osab","");
	var file = file_text_open_read(file_location);
	var object_data = [];
	
	    while (!file_text_eof(file)) { // Read until end of file
			var cut_line = string_split(file_text_read_string(file),",");
			//array_push(object_data,[cut_line[0],cut_line[1]
			
			
			
			
			//]);
			show_debug_message(cut_line[0]);
			file_text_readln(file); // Move to next line
        }

        file_text_close(file); // Close the file
}