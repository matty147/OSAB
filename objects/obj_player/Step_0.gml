if !global.pause
{

	var dash = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(vk_space)
	
	var move_x = keyboard_check(ord("D")) - keyboard_check(ord("A"))
	if move_x == 0
	{
		move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
	}
	
	var move_y = keyboard_check(ord("S")) - keyboard_check(ord("W"))
	if move_y == 0
	{
		move_y = keyboard_check(vk_down) - keyboard_check(vk_up);
	}

	if (move_x != 0 || move_y != 0) {
	    var length = sqrt(sqr(move_x) + sqr(move_y));
	    move_x /= length;
	    move_y /= length;
	}

	if dash == 1	
	{
		dash_speed = 8;
		is_invincible = true;
		is_dashing = true;
		alarm[0] = invincible_time * fps;
	}
	if dash_speed > 1
	{
		dash_speed--; 	
	}

	move_y *= dash_speed;
	move_x *= dash_speed;

	// horizontal
	for (var i = 0; i < 10; i++)
	{
		if !place_meeting(x + move_x * _speed,y,obj_wall){
			x += move_x * _speed;
			_speed = def_speed;
			break;
		}
		_speed -= 1;
	}

	//vertical
	for (var i = 0; i < 10; i++)
	{
		if !place_meeting(x,y  + move_y * _speed,obj_wall){
			y += move_y * _speed;
			_speed = def_speed;
			break;
		}
		_speed -= 1;
	}
	
	//if move_x != 0 && move_y != 0
	//{
		image_angle = arctan2(move_y * -1 ,move_x) * (180 / pi); // up and down are switched
	//}
	
	move_x = move;
	move_y = move;


	var _inst = instance_place(x,y,obj_enemy)
	if place_meeting(x, y, _inst) && _inst.hitbox == true
	{
		if !is_invincible && !is_dashing
		{
			health--;	
			is_invincible = true;
			alarm[0] = invincible_time * fps;
		}
	}

	if is_invincible == true && global.runtime % 5 == 0 && !is_dashing
	{
		image_index++;
	}else image_index = 0;

	if health < 0
	{
		show_debug_message("dead");
		room_restart();		
	}
	
}

//show_debug_message("health:" + string(health));