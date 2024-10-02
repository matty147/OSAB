global.runtime++;

//show_debug_message(global.runtime);

if keyboard_check_released(ord("R"))
{
	game_restart();	
}

if keyboard_check_pressed(vk_escape)
{
	game_end();	
}

if !read_file
{	
	button += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

	
	if button > button_max
	{
		button = button_max;
	}else if button < 0
	{
		button = 0;	
	}
}

// spawn objects after the file is read until there are no more to spawn
if read_file && current_index < array_length(_x) && _time[current_index] == global.runtime
{
	var instance = instance_create_layer(_x[current_index],_y[current_index],"Spawned",obj_enemy);
	instance.image_index = _id[current_index];
	instance.image_xscale = _size[current_index];
	instance.image_yscale = _size[current_index];
	instance.angle = _angle[current_index];
	instance._speed = _speed[current_index];
	instance.image_alpha = _alpha[current_index];
	instance.survive_speed = 500;
	current_index++;
	
	
	//spawning enemies on the same frame
	while current_index < array_length(_x) && _time[current_index] == global.runtime
	{
		instance = instance_create_layer(_x[current_index],_y[current_index],"Spawned",obj_enemy);
		instance.image_index = _id[current_index];
		instance.image_xscale = _size[current_index];
		instance.image_yscale = _size[current_index];
		instance.angle = _angle[current_index];
		instance._speed = _speed[current_index];
		instance.image_alpha = _alpha[current_index];
		instance.survive_speed = 500;
		current_index++;	
	}
}

if read_file && _time[array_length(_x) - 1] >= global.runtime
{
	end_game = 250;
}end_game--;

if instance_number(obj_enemy) <= 0 && read_file && end_game < 0
{
	room_goto(main_menu);
	//game_end();	
}