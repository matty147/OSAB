/* changeble vars
	function id: id of what the button does
	button_title: display title of the button
	button_id: id for selecting buttons when using keyboad/controller
	title_position: where on the button will the text be displayed (left/right/middle)
	moved_position_x: move button from default spot to this var. only used in options
	move: if the button should move 
	hidden: if hte button should hide as default
*/


image_speed = 0;
image_index = 0;
mouse_hover = true
display_text = true;
pop_up = false;

if hidden
{
	display_text = false;	
}

global.level_name = "test";

scrollable = false;

alarm[0] = fps * 1;

button_bg = instance_find(obj_menu_button_bg, 0);
clicked = false;
original_x = x;

//deactivate all layers except manager and main
//all layers have to be on when compiling or else it wont work!!!
instance_activate_layer("main");
instance_deactivate_layer("options");
instance_deactivate_layer("credits");
instance_deactivate_layer("level_select");
