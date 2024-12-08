draw_set_halign(fa_center);
draw_set_color(c_orange);
draw_set_valign(fa_middle);

if instance.hide
{
	draw_text_transformed(x + sprite_width/2,y + sprite_height/2,"U",2,2,0);
}else draw_text_transformed(x + sprite_width/2,y + sprite_height/2,"D",2,2,0);