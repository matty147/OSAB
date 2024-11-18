draw_set_color(c_white);
draw_set_halign(fa_center);

if display_text
{
	draw_line(x + margin_x, line_y, x + sprite_width - margin_x, line_y);

	// Text
	draw_set_font(fnt_large);

	if (instance.menu_id == 0) {
	    draw_text(x + sprite_width / 2, text_y, "Welcome");
	} else if (instance.menu_id == 2) || (instance.menu_id == 20){
		if hidden
		{
			if instance.menu_id == 20
			{
				draw_text(x + sprite_width / 2, text_y, "Game setting");
			}else if instance.menu_id == 21
			{
				draw_text(x + sprite_width / 2, text_y, "Graphics setting");
			}else if instance.menu_id == 22
			{
				draw_text(x + sprite_width / 2, text_y, "Audio setting");
			}
			
		}else draw_text(x + sprite_width / 2, text_y, "Options");
	} else if (instance.menu_id == 1){
		draw_text(x + sprite_width / 2, text_y, "Level Details");
	}
	
}