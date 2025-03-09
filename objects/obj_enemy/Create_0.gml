image_speed = 0;
//survive_speed = random_range(100, 100); //change!!!!
hitbox = false;
show_hitbox = 50;

amplitude = 2; // 10 is realy cool 
frequency = 2;
wave_angle = 0;

level_object_list = [ //object name + siZe
"all_spike_saw", //0
"circle", //1
"empty_triangle", //2
"halfcircle", //3
"enemy", //4
"house",//5
"moon",//6
"rectangle", //7
"rounded_polygon",//8
"rounded_rect",//9
"snake",//10
"spike",//11
"spike_floor",//12
"spike_saw",//13
"spike_saw_hole",//14
"sun"//15
];


if !variable_instance_exists(id,"survive_speed") // check if the value is declared if not declare it
{
	survive_speed = 0;	
}

//if !variable_instance_exists(id,"survive_speed") // check if the value is declared if not declare it
//{
	object_sprite = 0;	
//}

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
	