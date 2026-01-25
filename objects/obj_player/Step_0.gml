function scr_input_get(p, act, device, controller_id)
{
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

function calculate_hit_force(enemy_object)
{
	
	var dir = point_direction(x,y,enemy_object.x, enemy_object.y);
	var kb = 5;

	var hsp = -lengthdir_x(kb, dir);
	var vsp = -lengthdir_y(kb, dir);

	return [hsp, vsp];
}

function create_particles(survive_time, size, particle_amount)
{
		for (var i = 0; i < particle_amount;i++)
	{
		var my_part = instance_create_depth(x,y,depth,obj_particle);
		
		with (my_part)
		{
			// sprite = obj_player.sprite_index;
			left = irandom_range(0,sprite_width / 2);
			top = irandom_range(0,sprite_height / 2);
			width = irandom_range(1,10);
			height = irandom_range(1,10);
			spd = irandom_range(1,5);
			dir = irandom_range(0,360);
			direction = dir;
			speed = spd;
		}
		
		my_part.width = irandom_range(1,size);
		my_part.height = irandom_range(1,size);
		my_part.survive_time = survive_time;
		my_part.sprite = sprite_index;
		my_part.image_index = image_index;
		
		show_debug_message("h");
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
		// update the stats
		remember_data[? "dash"] += (collect_points) ? 1: 0;
		update_score = true;
		audio_play_sound(snd_dash,1,false);
		
		dash_time = 5;
		coyote_dash_time = 0;
		vibration_amount = 0.5;
	}else dash_time = clamp(dash_time - 0.2,1,dash_time);
	
	y += move_y * _speed * clamp(dash_time,1,3.5) + force_position[1] * random_range(1,1.25);
	x += move_x * _speed * clamp(dash_time,1,3.5) + force_position[0] * random_range(1,1.25);
	
	x = clamp(x,8,room_width - 8);
	y = clamp(y,8,room_height - 8);

	if (abs(scr_input_get(player_ide, ACT.MOVE_X, p_device, controller_id)) || abs(scr_input_get(player_ide, ACT.MOVE_Y, p_device, controller_id)))
	{
		image_angle = lerp(image_angle,	arctan2(move_y * -1 ,move_x) * (180 / pi), 0.25);
	}

	var _inst = instance_place(x,y,obj_enemy);
	
	if (instance_place(x, y, _inst) && _inst.hitbox == true && hit_cooldown <= 0 && dash_time == 1)
	{
		remember_data[? "hit"] += (collect_points) ? 1: 0;
		update_score = true;
		audio_play_sound(snd_hit,1,false);
		
		// create_particles(20,10,10); // looks too confusing
		
		hit_cooldown = 50;
		_health--;
		vibration_amount = 2;
		
		force_position = calculate_hit_force(_inst);
		
		show_debug_message(force_position);
		
	}else hit_cooldown = clamp(hit_cooldown - 1, -1, hit_cooldown);
	
	if (_health < 0)
	{
		dead = true;
	}
}
	
if (hit_cooldown / 4 <= 5)
{
	force_position = [0,0];
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

if (dead)
{
	remember_data[? "death"] += (collect_points) ? 1: 0;
	update_score = true;
	
	create_particles(50,20,15);
	
	image_speed = 0;
	instance_destroy();
	var dead_player = instance_create_depth(x,y,depth,obj_dead_player);
	dead_player.player_ide = player_ide;
	dead_player.device = p_device;
	dead_player.controller_id = controller_id;
	dead_player.points = remember_data;
	dead_player.player_sprite = sprite_index;
}


// points

if (!global.pause && collect_points)
{
	if (distance_to_point(0,0) < camp_distance || distance_to_point(room_width,0) < camp_distance || distance_to_point(0,room_height) < camp_distance || distance_to_point(room_width,room_height) < camp_distance)
	{
		remember_data[? "corner_camp"] += (collect_points) ? 1: 0;
		update_score = true;
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
		update_score = true;
		
	}
	
	//move distance
	if (move_x != 0 || move_y != 0)
	{
		remember_data[? "moved_distance"] += 0.1;
		update_score = true;
	}
}

if (update_score)
{
	update_score = false;
	inp_score_board.player_stats[player_number] = remember_data;
}

remember_data[? "time_alive"]++;
remember_data[? "alone_time_alive"] += (instance_number(obj_player) == 1) ? 1 : 0;

if (!global.pause) // controller rumble
{
	gamepad_set_vibration(controller_id, vibration_amount, vibration_amount);
	vibration_amount -= 0.05;
}else gamepad_set_vibration(controller_id, 0, 0);