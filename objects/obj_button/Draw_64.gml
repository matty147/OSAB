
draw_set_colour(c_black);
draw_set_font (fnt_default);

if display_text
{

	//if !scrollable
	//{
		switch title_position
		{
			case "left":
				draw_set_halign(fa_left);
				draw_set_valign(fa_middle);
				draw_text_transformed(x - sprite_width + 5,y,button_title,2,2,0); // has to be in draw GUI or will render pixaleted.
				break;
		
			case "middle":
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				draw_text_transformed(x - sprite_width / 2,y,button_title,2,2,0); // has to be in draw GUI or will render pixaleted.
				break;
		
			case "right":
				draw_set_halign(fa_right);
				draw_set_valign(fa_middle);
				draw_text_transformed(x - 20,y,button_title,2,2,0); // has to be in draw GUI or will render pixaleted.
				break;
		
		}
	//}
}