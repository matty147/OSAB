randomise();

// Grid size
grid_size = 64;
offset = 32;

spawn_time = 30;

instance = instance_find(obj_timeline_time,0);
_manager = instance_find(manager,0);
bottom = instance_find(obj_timeline_bottom,0);

is_draggable = true;
dragging = false;

last_position_y = (round((y - 32) / 64) * 64) + 32;

edit_menu_popup = false;

paused = false;