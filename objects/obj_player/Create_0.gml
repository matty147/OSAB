image_speed = 0;
image_index = 0;

image_xscale = 0.75;
image_yscale = 0.75;

_speed = 10;
def_speed = _speed;

dash_time = 1; 

_health = 3;
dead = false;

coyote_dash_time = 0;

hit_cooldown = 0;

// actions
enum ACT
{
	DASH,
	MOVE_X,
	MOVE_Y
}

input_map = array_create(3);

// for player 1
input_map[0] = array_create(3);
input_map[0][ACT.DASH]   = vk_lshift;
input_map[0][ACT.MOVE_X] = { neg: ord("A"), pos: ord("D") };
input_map[0][ACT.MOVE_Y] = { neg: ord("W"), pos: ord("S") };

// for player 2
input_map[1] = array_create(3);
input_map[1][ACT.DASH]   = vk_space;
input_map[1][ACT.MOVE_X] = { neg: vk_left, pos: vk_right };
input_map[1][ACT.MOVE_Y] = { neg: vk_up,   pos: vk_down };

// for player 3
input_map[2] = array_create(3);
input_map[2][ACT.DASH]   = ord("C");
input_map[2][ACT.MOVE_X] = { neg: ord("F"), pos: ord("H") };
input_map[2][ACT.MOVE_Y] = { neg: ord("T"),   pos: ord("G") };

// for player 4
input_map[3] = array_create(3);
input_map[3][ACT.DASH]   = ord("N");
input_map[3][ACT.MOVE_X] = { neg: ord("J"), pos: ord("L") };
input_map[3][ACT.MOVE_Y] = { neg: ord("I"),   pos: ord("K") };

// for player controller
input_map[4] = array_create(3);
input_map[4][ACT.DASH]   = gp_face1;
input_map[4][ACT.MOVE_X] = gp_axislh;
input_map[4][ACT.MOVE_Y] = gp_axislv;

player_ide = 0;

p_device = "keyboard";
controller_id = 2;

camp_distance = 200;

remember_data = ds_map_create();

ds_map_add(remember_data,"hit",0);
ds_map_add(remember_data,"death",0);
ds_map_add(remember_data,"revive",0);
ds_map_add(remember_data,"dash",0);
ds_map_add(remember_data,"corner_camp",0);	