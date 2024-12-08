draw_set_halign(fa_left);
draw_set_color(c_orange);
draw_set_valign(fa_middle);

if instance.hide
{
	draw_text_transformed(x,y,"U",2,2,0);
}else draw_text_transformed(x,y,"D",2,2,0);