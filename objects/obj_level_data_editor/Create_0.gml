image_alpha = 0
hidden = visible;
x = room_width / 2
y = room_height / 2

default_x = x;
default_y = y;

hidden_x = x * 100;
hidden_y = y * 100;

image_xscale = 10;
image_yscale = 10;

name = instance_create_layer(x,y,"popups",obj_input_field);
name.depth = depth - 1;