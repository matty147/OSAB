draw_self();

if global.pause //temp
{
	draw_set_alpha(0.5);
	draw_rectangle_colour(0, 0, room_width, room_height, c_black,c_black,c_black,c_black,false);
	draw_set_alpha(1);
	draw_rectangle_colour(0, 0, room_width, 50, c_aqua,c_aqua,c_aqua,c_aqua,false);
	draw_set_colour(c_aqua);
	draw_set_font (fnt_default);
	draw_text_transformed(room_width/2 - 100,room_height/2,"Paused",2,2,0);
}