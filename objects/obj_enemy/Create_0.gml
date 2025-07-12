image_speed = 0;
set_up = true;
//survive_speed = random_range(100, 100); //change!!!!
hitbox = false;

if !variable_instance_exists(id,"show_hitbox") 
{
	show_hitbox = 25;
}

amplitude = 2; // 10 is realy cool 
frequency = 2;
wave_angle = 0;

_manager = instance_find(manager,0);

level_object_list = _manager.level_object_list;

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

if !variable_instance_exists(id,"positions")
{
	positions = [];	
}
	
positions_cur_position = 0