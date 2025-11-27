image_speed = 0;

player_ide = 0;

t = 0;
increment = 6; //degrees -- freq = 1 oscillation per second (1Hz) in a 30 fps room
amplitude = 15; //pixels of peak oscillation

//clone the y-position (or use x instead if you're doing horizontal oscillation)
yy = y;

x_speed = 1;

loader = instance_find(level_load,0);

inactive = 50;