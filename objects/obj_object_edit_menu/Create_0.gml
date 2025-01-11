spawn_time = 1 * fps;
parent_id = NaN;
setup = false;

object_x = 0;
object_y = 0;
object_rotation = 0;

delete_list = [];
//check if the object is overflowing
if y + sprite_height * 3 > room_height
{
	y -= sprite_height * 3;	
	show_debug_message("e");
}

//var instance = instance_find(,0);

x_pos = instance_create_layer(x + (sprite_width * 2) - 15, y + 10, "popups", obj_input_field);
y_pos = instance_create_layer(x + (sprite_width * 2) - 15, y + 60, "popups", obj_input_field);
rotation = instance_create_layer(x + (sprite_width * 2) - 15, y + 110, "popups", obj_input_field);
array_push(delete_list,x_pos);
array_push(delete_list,y_pos);
array_push(delete_list,rotation);

array_push(delete_list,id)
