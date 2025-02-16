instance = instance_find(obj_timeline_bottom,0);
_manager = instance_find(manager,0);
screen_size = sprite_width;

// number of timeticks visible on screen 
numb_of_timestamps = 15;


// distance between two time ticks in pixels
distance = round(screen_size/(numb_of_timestamps - 1)); // -1 to fill the whole sprite

// size of one second in pixels
second_size = round(distance / 5)


//time = 0;

offset = 0;  // start of the visible timeline in pixels 
start_time = 0;  // start of the visible timeline in time 

//local_offset = 0;  
 
scroll = 1;
play = false;

sound_id = snd_test; //sync_test