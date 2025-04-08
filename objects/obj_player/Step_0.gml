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
	
	var _inst = instance_place(x,y,obj_enemy)
	if place_meeting(x, y, _inst) && _inst.hitbox == true
	{
		if !is_invincible && !is_dashing
		{
			health--;	
			is_invincible = true;
			damaged = true;
			alarm[0] = invincible_time * fps;
		}
	}
	

	if dash == 1 && !dash_cooldown
	{
		dash_speed = 8;
		is_invincible = true;
		is_dashing = true;
		dash_cooldown = true;
		alarm[0] = invincible_time * fps;
		alarm[1] = (invincible_time + 0.005) * fps;
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
		if !place_meeting(x + move_x * _speed,y,obj_wall) && x > 0 && x < room_width{
			x += move_x * _speed;
			break;
		}
		_speed -= 1;
	}
	_speed = def_speed;

	//vertical
	for (var i = 0; i < 10; i++)
	{
		if !place_meeting(x,y  + move_y * _speed,obj_wall) && y > 0 && y < room_height{
			y += move_y * _speed;
			break;
		}
		_speed -= 1;
	}
	_speed = def_speed;
	


	if keyboard_check(vk_anykey)
	{
		image_angle = arctan2(move_y * -1 ,move_x) * (180 / pi); // up and down are switched
	}
	
	move_x = move;
	move_y = move;

	if damaged
	{
		image_speed = 1;
	}else
	{
		image_index = 0;
		image_speed = 0;	
	}

	if health < 0
	{
		show_debug_message("dead");
		dead = true;
		global.pause = true;
		//room_restart();		
	}
	
	if x < 0 || y < 0 || x > room_width || y > room_height // if player out of bounds
	{
		dead = true;
		global.pause = true;
	}
	
	
}