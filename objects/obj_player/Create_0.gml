image_speed = 0;
image_index = 0;

image_xscale = 0.75;
image_yscale = 0.75;

_speed = 10;
def_speed = _speed;

dash_time = 1; 

health = 3;
dead = false;

coyote_dash_time = 0;

hit_cooldown = 0;

enum ACT
{
	DASH,
	MOVE_X,
	MOVE_Y
}

input_map = array_create(3);

input_map[1] = {
    DASH: vk_shift,
    MOVE_X: { neg: ord("A"), pos: ord("D") },
    MOVE_Y: { neg: ord("W"), pos: ord("S") }
};

input_map[2] = {
    DASH: vk_space,
    MOVE_X: { neg: vk_left, pos: vk_right },
    MOVE_Y: { neg: vk_up, pos: vk_down }
};

player_ide = 1;