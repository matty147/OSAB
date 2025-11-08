if (state == CUR_EDITING.OBJECT)
{

	if (editor_object != noone)
	{
	
		//// menu name
		//var object_name = string_replace_all(display_name,"_"," ");
	
		//draw_set_valign(fa_middle);
		//draw_set_halign(fa_center);
		//draw_set_color(c_white);
	
		//draw_text_transformed(x + sprite_width / 2, y + string_height(object_name) * 2, object_name,2,2,0);
	
		//draw_line_color(x  + 100, y + string_height(object_name) * 2 + 15,x  + sprite_width - 100,y + string_height(object_name) * 2 + 15,c_gray,c_gray);
	
		//general
	
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
	else
	{
		// Hide all
		for (var i = 0; i < array_length(objects); i++) {
		    objects[i].visible = false;
		}

	}

		for (var i = 0; i < array_length(objects); i++) {
		    objects[i].image_xscale = inp_objects_settings[i][5];
		}
}