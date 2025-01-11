randomise();
window_set_fullscreen(true);

global.pause = false;

global.runtime = 0; // track starts

global.debug = false; //will open console menu


if !variable_global_exists("level_name") {
	global.level_name = "test";
}
selected_items = 0;

shortcuts_on = true;

id_of_button_selected = 4;

menu_id = 0;

button = 0;

button_repeat = false;

mouse_off = false;

mouse_xprevious = mouse_x;
mouse_yprevious = mouse_y;

position = NaN;

move_buttons = 0;

mouse_pressed_y = 0;

pop_up_id = 0;

global.pop_up = false;


show_debug_message("");

index = 0;
save[0] = "";

first_value = 0;
last_value = 10;
lemon = true;


//////////////////
mdoubleclick =-1;
clickdouble=0;

level_object_list = [ //object name
"player",
"test"
];

if !file_exists("lemon.png")
{
	lemon = false;
}

if room == main_menu
{
	//checks for available levels

    results = [];
    scr_read_files("levels", ".osab", results); // if the file dir is changed. reloading game maker is needed

    if array_length(results) > 0 {
        for (var i = 0; i < array_length(results); i++) {
            show_debug_message("File found: " + results[i]);
        }
    } else {
        show_debug_message("No files found.");
    }

        save = results;

	amount_of_buttons = 0;

	for (var i = 0; i < array_length(save) && i < 11; i += 1)
	{
		var	button_instance = instance_create_layer(room_width,-15 + i * 73,"level_select",obj_button)
		button_instance.button_title = filename_name(save[i]); //fetch the button display title
		button_instance.file_path =  save[i]; // path to the file
		button_instance.image_xscale = 0.3; // x scale of button
		button_instance.image_yscale = 0.3; // y scale of button
		button_instance.scrollable = true;  // if the button should scroll (only in layer level_select)
		button_instance.button_id = i; // id of the button for button for scrolling
		button_instance.title_position = "left"; // position of the text on button
		button_instance.selected_button_id = i;
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
		button_instance.selected_button_id = amount_of_buttons;
		amount_of_buttons++;		
	}	
	show_debug_message(amount_of_buttons);
	show_debug_message("array lenght: " + string(array_length(save)));
	show_debug_message(filename_dir(save[0])); // for path to the folder
	show_debug_message(filename_name(save[0])); // for name of the file

	var select_panel = instance_create_layer(0,640,"level_buttons",obj_select_panel);

}

if !lemon
{
	game_end();	
}