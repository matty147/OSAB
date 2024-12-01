if room == level
{
	if global.pause //temp
	{
		draw_set_alpha(0.5);
		draw_rectangle_colour(0, 0, room_width, room_height, c_black,c_black,c_black,c_black,false);
		draw_set_alpha(0.5);
		draw_rectangle_colour(0, 0, room_width, 50, c_aqua,c_aqua,c_aqua,c_aqua,false);
		draw_rectangle_colour(0, room_height, room_width, room_height - 50, c_aqua,c_aqua,c_aqua,c_aqua,false);
		draw_set_alpha(1);
		draw_set_colour(c_aqua);
		draw_set_font (fnt_default);
		draw_set_valign(fa_middle);
	}
}