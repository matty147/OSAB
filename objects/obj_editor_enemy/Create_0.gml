image_xscale = 0.75;

dragging = false;

edge_size = 15;
dragged_right_side = 0;

middle = false;

min_lenght_value = 0.1; // changed to smallest grid unit
max_lenght_value = 999;

distance_to_x = 0;

//grid_size = 64;

block_lenght = 1;
position = 0;
sub_block = 0.75;
timeline = instance_find(obj_timeline,0);
game_window = instance_find(obj_game_window,0)

_manager = instance_find(manager,0);

level_object_map = _manager.level_object_map;

timeline_height = timeline.sprite_height;

//basic
object_time = 10.54;
object_name = "default_object";
object_position = [545,235];
object_size = [2,1];
object_angle = 45;
sprite = "circle"


display_object = true;

obj_display_object = noone;