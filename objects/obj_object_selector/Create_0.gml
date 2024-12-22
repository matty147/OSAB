_manager = instance_find(manager,0);

image_speed = 0;
grabbing = 0;
def_pos_x = x;
def_pos_y = y;


//object_number is defined in the bg object

if object_number != -1
{
	sprite_name = "spr_" + string(_manager.level_object_list[object_number]);
	sprite_index = asset_get_index(sprite_name);

	obj_name = "obj_" + string(_manager.level_object_list[object_number]);	
}else
{
	obj_name = "obj_test";
	
}

