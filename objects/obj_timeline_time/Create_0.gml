instance = instance_find(obj_timeline_bottom,0);
screen_size = sprite_width;

show_debug_message("screen_size: " + string(screen_size));

numb_of_timestamps = 15;

distance = round(screen_size/(numb_of_timestamps - 1)); // -1 to fill the whole sprite

time = 0;

