image_speed = 0;

image_xscale = 0.5;
image_yscale = 0.5;

player_ide = 0;

t = 0;
increment = 3; //degrees -- freq = 1 oscillation per second (1Hz) in a 30 fps room
amplitude = 30; //pixels of peak oscillation

//clone the y-position (or use x instead if you're doing horizontal oscillation)
yy = y;

x_speed = 1;

loader = instance_find(level_load,0);

inactive = 50;

device = "keyboard";

controller_id = 0;

points = ds_map_create();