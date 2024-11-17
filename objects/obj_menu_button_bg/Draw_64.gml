draw_set_color(c_white);
draw_set_halign(fa_center);


if display_text
{
	draw_line(x + margin_x, line_y, x + sprite_width - margin_x, line_y);

	// Text
	draw_set_font(fnt_large);

	var instance = instance_find(manager, 0);

	if (instance.menu_id == 0) {
	    draw_text(x + sprite_width / 2, text_y, "Welcome");
	} else if (instance.menu_id == 2) {
	    draw_text(x + sprite_width / 2, text_y, "Options");
	} else if (instance.menu_id == 1){
		draw_text(x + sprite_width / 2, text_y, "Level Details");
	}
}