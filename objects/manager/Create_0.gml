randomise();
window_set_fullscreen(true);

global.pause = false;

global.runtime = 0; // track starts

if room = level
{

global.runtime = -30;	
	
}

global.debug = false; //will open console menu

selected_scrollable_button = false;

if !variable_global_exists("level_name") {
	global.level_name = "levels\\test\\test.osab";
}

if !variable_global_exists("story_level") {
	global.story_level = false;
}

if !variable_global_exists("cleared") {
	global.cleared = false;
}

if !variable_global_exists("cleared_levels") {
	global.cleared_levels = 0;
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

level_object_list = [ //object name + siZe
["all_spike_saw",0.065], //0
["circle",0.065], //1
["star",0.065], //2
["halfcircle",0.07], //3
["enemy",0.5], //4
["house",0.07],//5
["moon",0.063],//6
["rectangle",0.065], //7
["rounded_polygon",0.065],//8
["rounded_rect",0.065],//9
["snake",0.05],//10
["spike",0.05],//11
["spike_floor",0.065],//12
["spike_saw",0.065],//13
["spike_saw_hole",0.065],//14
["sun",0.065],//15
["large_arrow",0.065],//16
["heart",0.065],//17
["hexagon",0.065],//18
["industrial_circle",0.065],//19
["lightning",0.065],//20
["heart",0.065],//21
["main_boss",0.5],//22
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
			show_message("Error 404: Lemon Not Found.\nThe requested lemon could not be located. It might have been squeezed, zested, or simply never existed. Please check your citrus directory and try again.");
			game_end();
	 //show_error("Error: Went to wrong area. Aborting game.", true);

}