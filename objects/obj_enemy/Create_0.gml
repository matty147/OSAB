image_speed = 0;
//survive_speed = random_range(100, 100); //change!!!!
hitbox = false;
show_hitbox = 50;

amplitude = 2; // 10 is realy cool 
frequency = 2;
wave_angle = 0;

if !variable_instance_exists(id,"survive_speed") // check if the value is declared if not declare it
{
	survive_speed = 0;	
}

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
	