randomise();

// Grid size
grid_size = 64;
offset = 32;		
		
start_point = 0;
end_point = 0;

spawn_time = 30;

instance = instance_find(obj_timeline_time,0);
_manager = instance_find(manager,0);

is_draggable = true;
dragging = false;

last_position_y = -1;

edit_menu_popup = false;