randomise();

// Grid size
grid_size = 64;
offset = 32;

spawn_time = 30;
duration = 0;

instance = instance_find(obj_timeline_time,0);
_manager = instance_find(manager,0);
bottom = instance_find(obj_timeline_bottom,0);

display_image = obj_object_selector;

is_draggable = true;
dragging = false;

last_position_y = (round((y - 32) / 64) * 64) + 32;

edit_menu_popup = false;

paused = false;

object_x = x;
object_y = room_height/2;
object_rotation = 0;
object_x_scale = 1;
object_y_scale = 1; // cant have 1:2 object???
object_speed = 1;


extend = false;

min_object_stretch = 1;