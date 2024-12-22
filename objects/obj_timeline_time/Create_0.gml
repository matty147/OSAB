instance = instance_find(obj_timeline_bottom,0);
screen_size = sprite_width;

numb_of_timestamps = 15;

distance = round(screen_size/(numb_of_timestamps - 1)); // -1 to fill the whole sprite

time = 0;

offset = 0;
local_offset = 0;

scroll = 1;



/*

show_debug_message(time_stamps);

var last_value = time_stamps[array_length(time_stamps) -1];

array_insert(time_stamps, 0, last_value);

array_delete(time_stamps, array_length(time_stamps) -1, 1)

show_debug_message(time_stamps);

*/