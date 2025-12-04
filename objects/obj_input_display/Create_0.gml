
enum INPUT_METHODS {
    KEYBOARDS,
    CONTROLLER,
}

input_map_max = 4;

short_key = vk_multiply;

wait = 0;

already_added_con = [];
already_added_key = [];

player = instance_find(obj_player,1);

// this is where the curent in use inputs devices are stored
if (!variable_global_exists("input_map")) {
	global.input_map = [];
}

// this is where all of the controller ids are saved please do not delete this or it will fuck up everything using controllers
if (!variable_global_exists("gamepads"))
{
	global.gamepads = [];
}

if (level == room)
{
    visible = false;
}

image_yscale = 2;

image_xscale = 0;

// if (array_length(global.input_map) > 0)
// {
// 	image_xscale = (32 + array_length(global.input_map) * 74) / sprite_get_width(sprite_index);
// }else image_xscale = 0;

y = room_height - sprite_height;