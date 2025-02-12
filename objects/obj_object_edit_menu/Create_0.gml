spawn_time = 1 * fps;
parent_id = NaN;
setup = false;

object_name = "NaN";

object_x = 0;
object_y = 0;
object_rotation = 0;
object_x_scale = 1;
object_y_scale = 1;
object_time	= 1;
show_advanced_option = false;

delete_list = [];
//check if the object is overflowing
if y + sprite_height * 5 > room_height
{
	y -= sprite_height * 6.25;	
	show_debug_message("e");
}

//var instance = instance_find(,0);

var object_spawn_x = x + (sprite_width * 3.5) - 15;
x_pos = instance_create_layer(object_spawn_x , y + 60, "popups", obj_input_field);
y_pos = instance_create_layer(object_spawn_x , y + 110, "popups", obj_input_field);
rotation = instance_create_layer(object_spawn_x, y + 160, "popups", obj_input_field);
x_scale = instance_create_layer(object_spawn_x , y + 210, "popups", obj_input_field);
y_scale = instance_create_layer(object_spawn_x, y + 260, "popups", obj_input_field);
time = instance_create_layer(object_spawn_x, y + 310, "popups", obj_input_field);
check_box = instance_create_layer(object_spawn_x, y + 360, "popups", obj_check_box);
//advanced = instance_create_layer(x + sprite_width, y + 360, "popups", );	
array_push(delete_list,x_pos);
array_push(delete_list,y_pos);
array_push(delete_list,rotation);
array_push(delete_list,x_scale);
array_push(delete_list,y_scale);
array_push(delete_list,time);
array_push(delete_list,check_box);
//array_push(delete_list,advanced);
array_push(delete_list,id)
