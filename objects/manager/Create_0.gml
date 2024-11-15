randomise();
window_set_fullscreen(true);

global.pause = false;

global.runtime = 0; // track starts



menu_id = 0;

button = 0;

button_repeat = false;

mouse_off = false;

mouse_xprevious = mouse_x;
mouse_yprevious = mouse_y;

position = NaN;

move_buttons = 0;

mouse_pressed_y = 0;


show_debug_message("");

index = 0;
save[0] = "";

first_value = 0;
last_value = 10;
lemon = true;

if !file_exists("lemon.png")
{
	lemon = false;
}

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
		var	button_instance = instance_create_layer(room_width,-15 + i * 73,"level_select",obj_button)
		button_instance.button_title = save[i]; //fetch the button display title
		button_instance.image_xscale = 0.3; // x scale of button
		button_instance.image_yscale = 0.3; // y scale of button
		button_instance.scrollable = true;  // if the button should scroll (only in layer level_select)
		button_instance.button_id = i; // id of the button for button for scrolling
		button_instance.title_position = "left"; // position of the text on button
		amount_of_buttons++;
	}
	while amount_of_buttons < 11
	{
		var	button_instance = instance_create_layer(room_width,-15 + amount_of_buttons * 73,"level_select",obj_button)
		button_instance.button_title = "";
		button_instance.image_xscale = 0.3;
		button_instance.image_yscale = 0.3;
		button_instance.scrollable = true;
		button_instance.button_id = amount_of_buttons;
		button_instance.title_position = "left";
		amount_of_buttons++;		
	}
	show_debug_message(amount_of_buttons);
	show_debug_message("array lenght: " + string(array_length(save)));
	
}

if !lemon
{
	game_end();	
}