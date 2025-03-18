draw_self();
draw_set_valign(fa_top);
draw_set_halign(fa_center);

if !hidden // would use visible but gml does not like it for some dumb reason D:
{
	draw_text_transformed(x,y - sprite_height / 2,"Level Info",2,2,0);
}