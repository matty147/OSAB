function scr_input_get(p, act, device, controller_id) {

	if (device == "keyboard")
	{
	    var k = input_map[p][act];
	
	    if (is_struct(k)) {
	        return keyboard_check(k.pos) - keyboard_check(k.neg);
	    }
	
	    return keyboard_check_pressed(k);
	}else
	{
	    var k = input_map[4][act];
	
		if (act != ACT.DASH)
		{
			return gamepad_axis_value(controller_id,k);
		}
	
	    return gamepad_button_check_pressed(controller_id,k);
	}
}

if (!global.pause)
{
	
	var dash = scr_input_get(player_ide, ACT.DASH, p_device, controller_id);
	
	if (dash)
	{
	    coyote_dash_time = 7;
	} else
	{
	    coyote_dash_time = clamp(coyote_dash_time - 1, 0, coyote_dash_time);
	}
	
	var move_x = scr_input_get(player_ide, ACT.MOVE_X, p_device, controller_id);
	var move_y = scr_input_get(player_ide, ACT.MOVE_Y, p_device, controller_id);
	
	if (move_x != 0 || move_y != 0)
	{
	    var length = sqrt(sqr(move_x) + sqr(move_y));
	    move_x /= length;
	    move_y /= length;
	}
	
	if (dash && dash_time <= 1 || coyote_dash_time > 0 && dash_time <= 1)
	{
		// show_debug_message(coyote_dash_time);
		remember_data[? "dash"]++;
		dash_time = 3.5;
		coyote_dash_time = 0;
	}else dash_time = clamp(dash_time - 0.2,1,dash_time);
	
	
	y += move_y * _speed * dash_time;
	x += move_x * _speed * dash_time;
	
	x = clamp(x,8,room_width - 8);
	y = clamp(y,8,room_height - 8);

	if (abs(scr_input_get(player_ide, ACT.MOVE_X, p_device, controller_id)) || abs(scr_input_get(player_ide, ACT.MOVE_Y, p_device, controller_id)))
	{
		image_angle = lerp(image_angle,	arctan2(move_y * -1 ,move_x) * (180 / pi), 0.25);
	}

	var _inst = instance_place(x,y,obj_enemy);
	
	if (instance_place(x, y, _inst) && _inst.hitbox == true && hit_cooldown <= 0 && dash_time == 1)
	{
		remember_data[? "hit"]++;
		hit_cooldown = 50;
		_health--;
	}else hit_cooldown = clamp(hit_cooldown - 1, -1, hit_cooldown);
	
	if (_health < 0)
	{
		dead = true;
	}
	
	if (hit_cooldown > 0)
	{
		image_speed = 1;
		
		if (image_index % 2 == 0)
		{
			image_index = (3 - _health) * 2;
		}
	}else
	{
		image_index = (3 - _health) * 2;
		image_speed = 0;	
	}
}

if (dead)
{
	remember_data[? "death"]++;
	
	image_speed = 0;
	instance_destroy();
	var dead_player = instance_create_depth(x,y,depth,obj_dead_player);
	dead_player.player_ide = player_ide;
	dead_player.device = p_device;
	dead_player.controller_id = controller_id;
	dead_player.points = remember_data;
}

// points

if (!global.pause)
{
	if (distance_to_point(0,0) < camp_distance || distance_to_point(room_width,0) < camp_distance || distance_to_point(0,room_height) < camp_distance || distance_to_point(room_width,room_height) < camp_distance)
	{
		// show_debug_message($"player {player_ide} is in a corner camping");
		remember_data[? "corner_camp"]++;
	}
	
	
	// lmao this is bad XD
	near_point = (floor(global.runtime) % 50 == 0) ? [x,y] : near_point;
	
	// show_debug_message(afk_timer);
	
	if (distance_to_point(near_point[0], near_point[1]) < 50)
	{
		afk_timer--;
	}else afk_timer = 100;
	
	if (afk_timer < 0)
	{
		remember_data[? "afk"]++;
	}
}