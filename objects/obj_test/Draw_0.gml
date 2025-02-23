draw_self();
//draw_line(start_point,y,end_point,y);

	if !dragging
	{
		if x > instance.x && room_width > x
		{
			draw_sprite_ext(asset_get_index(string(display_image)),0,x + 16,y,display_object_size* 1/3,display_object_size * 1/3,0,c_white,1);
			
			draw_sprite_ext(asset_get_index(string(display_image)),0,object_x,object_y,real(object_x_scale) * display_object_size,real(object_y_scale) * display_object_size,0,c_white,1);
			//draw_rectangle(real(object_x),real(object_y),real(object_x ) + 10, real(object_y) + 10,false);

			draw_set_color(c_white);

			var end_x = real(object_x) + lengthdir_x(50, real(object_rotation)) + 5;
			var end_y = real(object_y) + lengthdir_y(50, real(object_rotation)) + 5;
			
				if bottom.help_line
				{
					draw_set_color(c_lime)
					draw_line(x + sprite_width / 2,y,object_x,object_y);	
				}
				
				if bottom.show_checkerboard
				{
					draw_line_color(real(object_x),real(object_y),end_x, end_y,c_white,c_white);	
				}
		}
	}

