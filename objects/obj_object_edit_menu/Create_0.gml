spawn_time = 1 * fps;
parent_id = NaN;

object_x = 0;
object_y = 0;
object_rotacion = 0;

//var instance = instance_find(,0);

x_pos = instance_create_layer(x + (sprite_width * 2) - 15, y + 10, "popups", obj_input_field);
x_pos.image_xscale = 2;
x_pos.x -= x_pos.sprite_width; //adjust the input field even more
x_pos.depth = depth - 1;
x_pos.max_text_lenght = 4;

y_pos = instance_create_layer(x + (sprite_width * 2) - 15, y + 60, "popups", obj_input_field);
y_pos.image_xscale = 2;
y_pos.x -= y_pos.sprite_width; //adjust the input field even more
y_pos.depth = depth - 1;
y_pos.max_text_lenght = 4;