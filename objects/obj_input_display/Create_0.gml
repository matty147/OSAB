
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

image_yscale = 2.75;

image_xscale = 0;

y = room_height - sprite_height;