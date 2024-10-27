randomise();
window_set_fullscreen(true);

global.pause = false;

global.runtime = 0; // track starts



menu_id = 0;

button = 0

position = NaN;

move_buttons = 0;

mouse_pressed_y = 0;


show_debug_message("");

index = 0;
save[0] = "";

first_value = 0;
last_value = 10;

if room == main_menu
{
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

	amount_of_buttons = 0;

	for (var i = 0; i < array_length(save) && i < 11; i += 1)
	{
	var	button_instance = instance_create_layer(767,-15 + i * 73,"level_select",obj_button)
		button_instance.button_title = save[i];
		button_instance.image_xscale = 10.5;
		button_instance.image_yscale = 2.166;
		button_instance.scrollable = true;
		amount_of_buttons++;
	}
	while amount_of_buttons < 11
	{
		var	button_instance = instance_create_layer(767,-15 + amount_of_buttons * 73,"level_select",obj_button)
		button_instance.button_title = "";
		button_instance.image_xscale = 10.5;
		button_instance.image_yscale = 2.166;
		button_instance.scrollable = true;
		amount_of_buttons++;		
	}
	show_debug_message(amount_of_buttons);
	show_debug_message("array lenght: " + string(array_length(save)));
	
}
