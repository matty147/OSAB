draw_set_halign(fa_left);
draw_set_color(c_white);
draw_set_valign(fa_middle);
draw_text_transformed(x + 10,y + sprite_height / 2,"timeline " + string(timeline_number),2,2,0);

if timeline_hidden
{
	draw_rectangle_color(x + sprite_width - 30,y + 20,x + sprite_width - 5,y + sprite_height - 20,c_white,c_white,c_white,c_white,false);
}else draw_rectangle_color(x + sprite_width - 30,y + 20,x + sprite_width - 5,y + sprite_height - 20,c_black,c_black,c_black,c_black,false);