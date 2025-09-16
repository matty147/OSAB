if (live_call()) return live_result;

if editor_object != noone
{
	var object_name = display_name;
	
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	
	draw_text_transformed(x + sprite_width / 2, y + string_height(object_name) *2, object_name,2,2,0);
}