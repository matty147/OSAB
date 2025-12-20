
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

if (level == room)
{
    visible = false;
}

image_yscale = 3;

image_xscale = 0;

y = room_height - sprite_height;