
function scr_input_get(p, act) {

    var k = input_map[p][act];

    if (is_struct(k)) {
        return keyboard_check(k.pos) - keyboard_check(k.neg);
    }

    return keyboard_check_pressed(k);
}

if (!global.pause)
{
	// show_debug_message(player_ide);
	
	var dash = scr_input_get(player_ide, ACT.DASH);
	
	if (dash) {
	    coyote_dash_time = 7;
	} else {
	    coyote_dash_time = clamp(coyote_dash_time - 1, 0, coyote_dash_time);
	}
	
	var move_x = scr_input_get(player_ide, ACT.MOVE_X);
	var move_y = scr_input_get(player_ide, ACT.MOVE_Y);
	
	
	if (move_x != 0 || move_y != 0) {
	    var length = sqrt(sqr(move_x) + sqr(move_y));
	    move_x /= length;
	    move_y /= length;
	}
	
	if (dash && dash_time <= 1 || coyote_dash_time > 0 && dash_time <= 1)
	{
		show_debug_message(coyote_dash_time);
		
		dash_time = 3.5;
		coyote_dash_time = 0;
	}else dash_time = clamp(dash_time - 0.2,1,dash_time);
	
	
	y += move_y * _speed * dash_time;
	x += move_x * _speed * dash_time;
	
	x = clamp(x,8,room_width - 8);
	y = clamp(y,8,room_height - 8);


	if (keyboard_check(vk_anykey))
	{
		image_angle = lerp(image_angle,	arctan2(move_y * -1 ,move_x) * (180 / pi), 0.25);
	}

	var _inst = instance_place(x,y,obj_enemy);
	
	if (instance_place(x, y, _inst) && _inst.hitbox == true && hit_cooldown <= 0 && dash_time == 1)
	{
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
	image_speed = 0;
	instance_destroy();
}