draw_set_valign(fa_top);
draw_set_halign(fa_center);

if !hidden // would use visible but gml does not like it for some dumb reason D:
{
	draw_text_transformed(x + sprite_width / 2,y,"Level Info",2,2,0);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var _x = sprite_width * 1/2 - 20; 
	
	draw_text_transformed(x - _x,name.y - 7,"Level Name",2,2,0);
	draw_text_transformed(x - _x,description.y - 7,"Level description",2,2,0);
	draw_text_transformed(x - _x,lenght.y - 7,"Level lenght",2,2,0);
	draw_text_transformed(x - _x,difficulty.y - 7,"Level difficulty",2,2,0);
}