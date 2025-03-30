image_alpha = 0
hidden = visible;

default_x = x;
default_y = y;

hidden_x = x * 100;
hidden_y = y * 100;

set_values = false;

level_name = "";
level_description = "";
level_lenght = 0;
level_difficulty = 0;

_manager = instance_find(manager,0);

add_x_position = sprite_width * 2/4 + 10;

name = instance_create_layer(x + add_x_position,y + sprite_width * 1/6,"popups",obj_input_field);
name.depth = depth - 1;
name.image_xscale = 5.5;
name.text = "Unnamed level";
name.last_valid_input = "Unnamed level";
name.max_text_lenght = 30;


description = instance_create_layer(x + add_x_position,y + sprite_width * 2/6,"popups",obj_input_field);
description.depth = depth - 1;
description.image_xscale = 5.5;
description.text = "None";
description.last_valid_input = "None";
description.max_text_lenght = 30;


lenght = instance_create_layer(x + add_x_position,y + sprite_width * 3/6,"popups",obj_input_field);
lenght.depth = depth - 1;
lenght.image_xscale = 5.5;
lenght.text = "0";
lenght.last_valid_input = "0";
lenght.numeric_check = true;

difficulty = instance_create_layer(x + add_x_position,y + sprite_width * 4/6,"popups",obj_input_field);
difficulty.depth = depth - 1;
difficulty.image_xscale = 5.5;
difficulty.text = "0";
lenght.last_valid_input = "0";
lenght.numeric_check = true;

save = instance_create_layer(x + sprite_width * 3/3 - 25,y + sprite_width * 4/5 + 50,"popups",obj_button);
save.depth = depth - 1;
save.image_xscale = 0.1165644; 
save.image_yscale = 0.266055;
save.button_title = "save";
save.function_id = 23;
save.button_id = -1;


load = instance_create_layer(x + sprite_width * 1/3 + 35,y + sprite_width * 4/5 + 50,"popups",obj_button);
load.depth = depth - 1;
load.image_xscale = 0.1165644; 
load.image_yscale = 0.266055;
load.button_title = "load";
load.function_id = 24;
load.button_id = -1;