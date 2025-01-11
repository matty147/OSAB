draw_self();

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if selected && timer > 0
{
	draw_text(x + sprite_width / 2,y + sprite_height / 2,string(text) + "_");
}else draw_text(x + sprite_width / 2,y + sprite_height / 2,string(text) + "  ");

if timer < -fps
{
	
	timer = fps;
	
}timer--;


