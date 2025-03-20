image_alpha = 0
hidden = visible;

default_x = x;
default_y = y;

hidden_x = x * 100;
hidden_y = y * 100;


var name_y = sprite_width * 1/8;

name = instance_create_layer(x,y + name_y,"popups",obj_input_field);
name.depth = depth - 1;
name.image_xscale = 7;


var description_y = name_y - (sprite_width - name_y) * 1/4 ;

description =  instance_create_layer(x,y - description_y,"popups",obj_input_field);
description.depth = depth - 1;
name.image_xscale = 7;


var level_lenght_y = name_y - (sprite_width - name_y) * 2/6;

lenght = instance_create_layer(x,y - level_lenght_y,"popups",obj_input_field);
lenght.depth = depth - 1;
name.image_xscale = 7;


var difficulty_y = name_y + (sprite_width - name_y) * 1/6;

difficulty = instance_create_layer(x,y + difficulty_y,"popups",obj_input_field);
difficulty.depth = depth - 1;
name.image_xscale = 7;
