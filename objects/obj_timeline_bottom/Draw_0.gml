if show_checkerboard
{

	draw_set_color(c_gray);


	//smoll checkerboard
	for (var i = 0; i < room_height; i += checkerboard_size) {
		if !hide
		{
			if i < room_height - numb_of_timelines * timeline_time.sprite_height * 2 - 25
			{
				draw_line(0, i, room_width, i);
			}
		}else draw_line(0, i, room_width, i);
	}
	
	for (var i = 0; i < room_width; i += checkerboard_size) {
		if !hide
		{
			draw_line(i, 0, i, room_height - numb_of_timelines * timeline_time.sprite_height * 2 - 25);
		}else draw_line(i, 0,i ,room_width);
	}
	 
	
	//big checkerboard
	draw_set_color(c_dkgray)
	for (var i = 0; i < room_height; i += checkerboard_size * 2) {
		if !hide
		{
			if i < room_height - numb_of_timelines * timeline_time.sprite_height * 2 - 25
			{
				draw_line(0, i, room_width, i);
			}
		}else draw_line(0, i, room_width, i);
	}
	
	for (var i = 0; i < room_width; i += checkerboard_size * 2) {
		if !hide
		{
			draw_line(i, 0, i, room_height - numb_of_timelines * timeline_time.sprite_height * 2 - 25);
		}else draw_line(i, 0,i ,room_width);
	}
	
	if mouse_check_button_pressed(mb_left)  && keyboard_check(vk_alt)
	{
			point_1[0] = mouse_x;
			point_1[1] = mouse_y;
	}
	if mouse_check_button_pressed(mb_right)  && keyboard_check(vk_alt)
	{
			point_2[0] = mouse_x;
			point_2[1] = mouse_y;
	}
	
	draw_circle_color(point_1[0],point_1[1],5,c_aqua,c_aqua,false);
	draw_circle_color(point_2[0],point_2[1],5,c_orange,c_orange,false);
	draw_line_color(point_1[0],point_1[1],point_2[0],point_2[1],c_white,c_white);
	
	rotation = round(point_direction(point_1[0],point_1[1],point_2[0],point_2[1]));
	
}