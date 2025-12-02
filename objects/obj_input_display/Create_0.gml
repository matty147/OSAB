
enum INPUT_METHODS {
    KEYBOARDS,
    CONTROLLER,
}

input_map_max = 4;

image_yscale = 2;

short_key = vk_multiply;

wait = 0;

gamepads = [];

allready_added_con = [];
allready_added_key = [];

player = instance_find(obj_player,1);

if (!variable_global_exists("input_map")) {
	global.input_map = [];
}

if (level == room)
{
    visible = false;
}