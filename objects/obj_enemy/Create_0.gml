image_speed = 0;
//survive_speed = random_range(100, 100); //change!!!!
hitbox = false;
show_hitbox = 50;

amplitude = 2; // 10 is realy cool 
frequency = 2;
wave_angle = 0;

level_object_list = [ //object name + siZe
["all_spike_saw",0.065], //0
["circle",0.065], //1
["empty_triangle",0.065], //2
["halfcircle",0.07], //3
["enemy",0.5], //4
["house",0.07],//5
["moon",0.063],//6
["rectangle",0.065], //7
["rounded_polygon",0.065],//8
["rounded_rect",0.065],//9
["snake",0.05],//10
["spike",0.05],//11
["spike_floor",0.065],//12
["spike_saw",0.065],//13
["spike_saw_hole",0.065],//14
["sun",0.065]//15
];


if !variable_instance_exists(id,"survive_speed") // check if the value is declared if not declare it
{
	survive_speed = 0;	
}

	object_sprite = 0;	

if !variable_instance_exists(id,"angle") // check if the value is declared if not declare it
{
	angle = 0;	
}

if !variable_instance_exists(id,"_speed") // check if the value is declared if not declare it
{
	_speed = 0;	
}

if !variable_instance_exists(id,"spawned_time")
{
	spawned_time = 0;
}

if !variable_instance_exists(id,"move")
{
	move = false;	
}
	