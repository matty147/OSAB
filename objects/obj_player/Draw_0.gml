draw_self();

if (dash_time > 1)
{
	var behind_player_x = x - lengthdir_x(2 * dash_time * _speed,image_angle);
	var behind_player_y = y - lengthdir_y(2 * dash_time * _speed,image_angle);

	draw_sprite_ext(sprite_index, 0,behind_player_x,behind_player_y,0.5,0.5,image_angle,c_white,1);
}

// draw_text_color(x,y - 40,remember_data[? "afk"],c_white,c_white,c_white,c_white,1);

// draw_circle_color(near_point[0],near_point[1],1,c_white,c_white,false);
