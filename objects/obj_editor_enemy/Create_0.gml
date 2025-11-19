
timeline = instance_find(obj_timeline,0);
game_window = instance_find(obj_game_window,0);

_manager = instance_find(manager,0);

image_xscale = 0.75;
image_yscale = 0.75;

depth = timeline.depth - 1;

dragging = false;

edge_size = 15;
dragged_right_side = 0;

middle = false;

// this is bs why do i have this????
min_lenght_value = 0.1; // changed to smallest grid unit
max_lenght_value = 999;

distance_to_x = 0;

//grid_size = 64;

block_lenght = 1;
position = 0;
sub_block = 0.75;

level_object_map = _manager.level_object_map;

timeline_height = timeline.sprite_height;

//basic
object_time = 10;
object_name = "default_object"; // why do we need a name and a sprite_name it should be the same thing?
object_position = [545,235];
object_size = [2,1];
object_angle = 45;
sprite = "circle";

// move
object_speed = 1;
object_image_alpha = 1;
object_survive_speed = 5; 
object_move = true; // no clue what this is but its here :D
object_show_hitbow = 25;
object_move_type = "None";

// will have to add all the values from move_type here T-T

object_spline = false;
object_positions = [];
object_bounce = [];
object_gravity = 0;
object_friction = true;
object_end_scale = [];
object_scale_speed = [];

display_object = true;
update_display_object = true;

obj_display_object = noone;

editor_x = -1;
editor_object_time = -1;

selected = false;