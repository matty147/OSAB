image_speed = 0;
image_index = 0;
mouse_hover = true

global.level_name = "test";

scrollable = false;

alarm[0] = fps * 1;

button_bg = instance_find(obj_menu_button_bg, 0);
clicked = false;
original_x = button_bg.x;

//deactivate all layers except manager and main
//all layers have to be on when compiling or else it wont work!!!
instance_activate_layer("main");
instance_deactivate_layer("options");
instance_deactivate_layer("credits");
instance_deactivate_layer("level_select");
