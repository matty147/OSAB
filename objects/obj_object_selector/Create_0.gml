_manager = instance_find(manager,0);

image_speed = 0;
grabbing = 0;

offset = 16;

x = x - offset;
def_pos_x = x;
def_pos_y = y;

//object_number is defined in the bg object

if object_number != -1
{
	sprite_name = "spr_" + string(_manager.level_object_list[object_number][0]);
	
	sprite_index = asset_get_index(sprite_name);
	display_sprite_size = real(_manager.level_object_list[object_number][1]);
	image_xscale = display_sprite_size;
	image_yscale = display_sprite_size;
	

	//obj_name = "obj_" + string(_manager.level_object_list[object_number]);	
}else sprite_name = "delete"

