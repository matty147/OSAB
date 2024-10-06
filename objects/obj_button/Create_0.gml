image_speed = 0;
image_index = 0;
mouse_hover = true;

scrollable = false;

//deactivate all layers except manager and main
//all layers have to be on when compiling or else it wont work!!!
instance_activate_layer("main");
instance_deactivate_layer("options");
instance_deactivate_layer("credits");
instance_deactivate_layer("level_select");
