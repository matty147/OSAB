draw_self();

if global.pause //temp
{
	draw_set_alpha(0.5);
	draw_rectangle_colour(50, 50, room_width - 50, room_height - 50, c_black,c_black,c_black,c_black,false);
	draw_set_alpha(1);
	draw_rectangle_colour(50, 50, room_width - 50, room_height - 50, c_aqua,c_aqua,c_aqua,c_aqua,true);
	draw_rectangle_colour(49, 49, room_width - 49, room_height - 49, c_aqua,c_aqua,c_aqua,c_aqua,true);
	draw_rectangle_colour(48, 48, room_width - 48, room_height - 48, c_aqua,c_aqua,c_aqua,c_aqua,true);
	draw_set_colour(c_aqua);
	draw_set_font (fnt_default);
	draw_text_transformed(room_width/2,room_height/2,"Paused",2,2,0);
}