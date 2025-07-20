if set_up
{

	var spr = "spr_" + string(level_object_list[object_sprite][0]);


	//show_debug_message(asset_get_index(spr));
	//show_debug_message(asset_get_index("spr_house"));

	sprite_index = asset_get_index(spr);

	image_index = 0;//asset_get_index("spr_house");

	image_xscale *= real(level_object_list[object_sprite][1]);
	image_yscale *= real(level_object_list[object_sprite][1]);
	set_up = false;
	
	
	if move_type == "bounce"
	{
		hspd = bounce[0];
		vspd = bounce[1];
	}

	show_debug_message($"move_type: {move_type}")

if move_type == "position" && splines
{
	show_debug_message(array_length(positions));

	for (var i = 0;array_length(positions) > i;i++)
	{
		show_debug_message($"{positions[i][0]},{positions[i][1]}");
	
			ds_list_add(points_x,positions[i][0]);
			ds_list_add(points_y,positions[i][1]);
	}

	show_debug_message($"spline: {points_x},{points_y}");
}

}

if !global.pause && move
{
	if show_hitbox < 00
	{
		hitbox = true;
	}else show_hitbox--;

	if hitbox == true
	{
		image_alpha = 1; 
	}
	
	switch(move_type)
	{
	
		case "None":
			x += cos(real(angle) * (pi / 180)) * real(_speed);
			y += sin(real(angle) * (pi / 180)) * real(_speed);
		
			if survive_speed < 0
			{
				instance_destroy();
			}else survive_speed--;
			break;
		
		case "position":
			
			if splines
			{
				
				show_debug_message($"spline cur loc: {spline_cur_location}")
				
				x = spline(spline_cur_location, points_x);
				y = spline(spline_cur_location, points_y);
			
				spline_cur_location += 0.01;
			
				if spline_cur_location >= 1
				{
					ds_list_destroy(points_x);
					ds_list_destroy(points_y);
					instance_destroy();
				}
				
			}else
			{
				var _x = positions[positions_cur_position][0];
				var _y = positions[positions_cur_position][1];
		
				if abs(x - _x) <= 10 && abs(y - _y) <= 10
				{
					positions_cur_position++;
				}else move_towards_point(_x,_y,_speed);		
			
			
				if positions_cur_position >= array_length(positions)
				{
					instance_destroy();
				}
			}
			break;
	
		case "bounce":
		
			vspd += _friction ? 0.5 : 0;
			
			x += hspd;
			
			if y < room_height - sprite_height/2
			{
				y += vspd;
			}
			
			if (place_meeting(x + hspd, y, obj_wall)){
			    hspd = -hspd;
			}
			
			if (place_meeting(x, y + vspd, obj_wall)) { // friciton
				vspd =  -vspd * 0.9;
				hspd *= 0.9;
			}

			if survive_speed < 0
			{
				instance_destroy();
			}else survive_speed--;
		
			break;
	}

}else move_towards_point(x,y,0);	
	//wave only on the y part	
	//x += cos(real(angle) * (pi / 180)) * real(_speed);
	//y += sin(real(angle) * (pi / 180)) * real(_speed) + sin(real(wave_angle) * (pi / 180)) * amplitude;

	//wave_angle += frequency;




	////same thing?
	//x += real(_speed); // Moves horizontally at constant speed
	//y += sin(real(wave_angle) * (pi / 180)) * amplitude; // Moves in a wave pattern vertically


	//moves there and back

	//// Variables to control the wave
	//var wave_amplitude = 10; // Size of the wave
	//var wave_frequency = 0.005; // Speed of the wave oscillation //0.005
	//var wave_offset = sin(current_time * wave_frequency) * wave_amplitude; // Calculate the wave offset based on time

	//// Main movement in the direction of the angle
	//x += cos(real(angle) * (pi / 180)) * real(_speed);
	//y += sin(real(angle) * (pi / 180)) * real(_speed);

	//// Add wave motion perpendicular to the movement direction
	//x += cos((real(angle) + 90) * (pi / 180)) * wave_offset;
	//y += sin((real(angle) + 90) * (pi / 180)) * wave_offset;

