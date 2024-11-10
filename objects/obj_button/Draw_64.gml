draw_self();
draw_set_colour(c_black);
draw_set_font (fnt_default);

switch title_position
{
	case "left":
		draw_set_halign(fa_left);
		draw_text_transformed(x - sprite_width + 5,y-15,button_title,2,2,0); // has to be in draw GUI or will render pixaleted.
		break;
		
	case "middle":
		draw_set_halign(fa_center);
		draw_text_transformed(x - sprite_width / 2,y-15,button_title,2,2,0); // has to be in draw GUI or will render pixaleted.
		break;
		
	case "right":
		draw_set_halign(fa_right);
		draw_text_transformed(x - 20,y-15,button_title,2,2,0); // has to be in draw GUI or will render pixaleted.
		break;
		
}