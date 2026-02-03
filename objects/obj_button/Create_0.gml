/* changeble vars
	function id: id of what the button does
	button_title: display title of the button
	button_id: id for selecting buttons when using keyboad/controller
	title_position: where on the button will the text be displayed (left/right/middle)
	moved_position_x: move button from default spot to this var. only used in options
	move: if the button should move 
	hidden: if the button should hide as default
	button_number: option menu button id
*/


image_speed = 0;
image_index = 0;
mouse_hover = true;
display_text = true;
pop_up = false;
selected_button_id = 1;
can_interact = false;

file_path = "";

if (hidden)
{
	display_text = false;	
}

scrollable = false;

alarm[0] = fps * 1;

button_bg = instance_find(obj_menu_button_bg, 0);
clicked = false;
original_x = x;
original_y = y;

if (show_extra_buttons)
{
	button_story_mode = instance_create_layer(x - 30,y,"main_spawned",obj_button);
	button_story_mode.image_alpha = 0;
	button_story_mode.image_xscale = 0.25;
	button_story_mode.image_yscale = 0.25;
	button_story_mode.function_id = 6; 
	button_story_mode.button_title = "Story mode";
	button_story_mode.button_id = -1;
	button_story_mode.move = true;
	button_story_mode.hidden = true;
	button_story_mode.moved_position_y = y + 37;
	button_story_mode.original_y = y;
	
	
	button_free_play = instance_create_layer(x - 30,y + 37,"main_spawned",obj_button);
	button_free_play.image_alpha = 0;
	button_free_play.image_xscale = 0.25;
	button_free_play.image_yscale = 0.25;
	button_free_play.function_id = 5; 
	button_free_play.button_title = "free play";
	button_free_play.button_id = -1;
	button_free_play.move = true;
	button_free_play.hidden = true;
	button_free_play.moved_position_y = y + 100;
	button_free_play.original_y = y;
}

//deactivate all layers except manager and main
//all layers have to be on when compiling or else it wont work!!!
instance_activate_layer("main");
instance_deactivate_layer("options");
instance_deactivate_layer("credits");
instance_deactivate_layer("level_select");

restart_from_checkpoint = false;

starting_x = x;