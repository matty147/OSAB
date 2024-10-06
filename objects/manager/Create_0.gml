randomise();
window_set_fullscreen(true);

global.runtime = 0; // track starts

menu_id = 0;

button = 0

end_game = 0;

current_index = 0;

read_file = false;

_time = [];
_id = [];
_x = [];
_y = [];
_size = [];
_angle = [];
_speed = [];
_alpha = [];

position = NaN;


if load_level
{

	//load file
	file = file_text_open_read("test.osab");

	//read file
	while (!file_text_eof(file)) {
		line = file_text_readln(file);
		
		_path_parts = string_split(line, ",");

		show_debug_message(_path_parts);

		//save file into arrays
		if _path_parts[0] != "//" // removes comments. comments must start with "//,"
		{
			array_push(_time,_path_parts[0]);		
			array_push(_id,_path_parts[1]);
			array_push(_x,_path_parts[2]);
			array_push(_y,_path_parts[3]);
			array_push(_size,_path_parts[4]);
			array_push(_angle, _path_parts[5])
			array_push(_speed, _path_parts[6])
			array_push(_alpha, _path_parts[7])
		}else show_debug_message("comment " + string(line));
		
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


show_debug_message("");

index = 0;
save[0] = "";


//checks for available levels

var _file = file_find_first("*.osab*", 0);

while ( _file != "" ) // file_find_first() / file_find_next() return "" (empty string) if no files found.
{
	_file = string_delete(_file, string_length(_file) - 4, 5);
	show_debug_message(_file + ".osab");
    save[index++] = _file; 
    _file = file_find_next();

}

show_debug_message("\nFound " + string(index) + " files.");

file_find_close();

show_debug_message("");


for (var i = 0; i < array_length(save) && i < 11; i += 1)
{
var	button_instance = instance_create_layer(767,-15 + i * 73,"level_select",obj_button)
	button_instance.button_title = save[i];
	button_instance.image_xscale = 10.5;
	button_instance.image_yscale = 2.166;
	button_instance.scrollable = true;		
}
