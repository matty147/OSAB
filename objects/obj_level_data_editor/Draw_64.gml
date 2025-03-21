draw_set_valign(fa_top);
draw_set_halign(fa_center);

if !hidden // would use visible but gml does not like it for some dumb reason D:
{
	draw_text_transformed(x + sprite_width / 2,y,"Level Info",2,2,0);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	draw_text_transformed(x + 20,name.y - 7,"Name:",2,2,0);
	draw_text_transformed(x + 20,description.y - 7,"Description:",2,2,0);
	draw_text_transformed(x + 20,lenght.y - 7,"Lenght:",2,2,0);
	draw_text_transformed(x + 20,difficulty.y - 7,"Difficulty:",2,2,0);
} 