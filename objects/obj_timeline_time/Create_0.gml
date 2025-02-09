instance = instance_find(obj_timeline_bottom,0);
_manager = instance_find(manager,0);
screen_size = sprite_width;

numb_of_timestamps = 15;

distance = round(screen_size/(numb_of_timestamps - 1)); // -1 to fill the whole sprite

//time = 0;

offset = 0;
local_offset = 0;

scroll = 1;
play = false;

sound_id = snd_test; //sync_test