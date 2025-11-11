if (live_call()) return live_result;

if (state == CUR_EDITING.OBJECT)
{

	if (editor_object != noone)
	{
		draw_set_valign(fa_middle);
		draw_set_halign(fa_left);
		draw_set_color(c_white);
	
		draw_text_transformed(x + 25, y + sprite_height * 1/15,"General",1.75,1.75,0);
		draw_line_color(x  + 25, y + sprite_height * 1/15 + 15,x  + string_width("General") * 2.5, y + sprite_height * 1/15 + 15,c_gray,c_gray);
		draw_text_transformed(x + 25, y + sprite_height * 1/15 + 40,$"Time: ",1.25,1.25,0);
		draw_text_transformed(x + 25, y + sprite_height * 1/15 + 70,$"Name: ",1.25,1.25,0);
	
		//transformation
	
		draw_set_valign(fa_middle);
		draw_set_halign(fa_left);
		draw_set_color(c_white);
	
		draw_text_transformed(x + 25, y + sprite_height * 1/3,"Transformations",1.75,1.75,0);
		draw_line_color(x  + 25, y + sprite_height * 1/3 + 15,x  + string_width("Transformations") * 2.1, y + sprite_height * 1/3 + 15,c_gray,c_gray);
		draw_text_transformed(x + 25, y + sprite_height * 1/3 + 40,$"Position: W            H",1.25,1.25,0);
		draw_text_transformed(x + 25, y + sprite_height * 1/3 + 70,$"Size:       W            H",1.25,1.25,0);
		draw_text_transformed(x + 25, y + sprite_height * 1/3 + 100,$"Angle:",1.25,1.25,0);
	}
}else if (state == CUR_EDITING.LEVEL_META)
{
		draw_set_valign(fa_middle);
		draw_set_halign(fa_left);
		draw_set_color(c_white);
	
		draw_text_transformed(x + 25, y + sprite_height * 1/15,"Meta",1.75,1.75,0);
		draw_line_color(x  + 25, y + sprite_height * 1/15 + 15,x  + string_width("Meta") * 2.5, y + sprite_height * 1/15 + 15,c_gray,c_gray);
		draw_text_transformed(x + 25, y + sprite_height * 1/15 + 40,$"Id: ",1.25,1.25,0); // should the user be able to edit this?
		draw_text_transformed(x + 25, y + sprite_height * 1/15 + 70,$"Name: ",1.25,1.25,0);
		draw_text_transformed(x + 25, y + sprite_height * 1/15 + 100,$"Desc: ",1.25,1.25,0);
		draw_text_transformed(x + 25, y + sprite_height * 1/15 + 130,$"Leng: ",1.25,1.25,0); // calc automaticly i guess?
		draw_text_transformed(x + 25, y + sprite_height * 1/15 + 160,$"Diff: ",1.25,1.25,0); // -//-
}
