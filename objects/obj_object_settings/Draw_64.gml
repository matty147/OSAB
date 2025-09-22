if (live_call()) return live_result;

if editor_object != noone
{
	// menu name
	var object_name = string_replace_all(display_name,"_"," ");
	
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	
	draw_text_transformed(x + sprite_width / 2, y + string_height(object_name) * 2, object_name,2,2,0);
	
	draw_line_color(x  + 100, y + string_height(object_name) * 2 + 15,x  + sprite_width - 100,y + string_height(object_name) * 2 + 15,c_gray,c_gray);
	
	//general
	
	draw_set_valign(fa_middle);
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	
	draw_text_transformed(x + 25, y + sprite_height * 1/5,"General",1.75,1.75,0);
	draw_line_color(x  + 25, y + sprite_height * 1/5 + 15,x  + string_width("General") * 2.5, y + sprite_height * 1/5 + 15,c_gray,c_gray);
	draw_text_transformed(x + 25, y + sprite_height * 1/5 + 40,$"Time: [0.000]",1.25,1.25,0);
	draw_text_transformed(x + 25, y + sprite_height * 1/5 + 70,$"Name: [Qorutle fuck]",1.25,1.25,0);
	
	//transformation
	
	draw_set_valign(fa_middle);
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	
	draw_text_transformed(x + 25, y + sprite_height * 2/5,"Transoframtions",1.75,1.75,0);
	draw_line_color(x  + 25, y + sprite_height * 2/5 + 15,x  + string_width("General") * 2.5, y + sprite_height * 2/5 + 15,c_gray,c_gray);
	draw_text_transformed(x + 25, y + sprite_height * 2/5 + 40,$"Position: W [758]    H [-50]",1.25,1.25,0);
	draw_text_transformed(x + 25, y + sprite_height * 2/5 + 70,$"Size:     W [2.0]    H [2.5]",1.25,1.25,0);
	draw_text_transformed(x + 25, y + sprite_height * 2/5 + 100,$"Angle:      [69]",1.25,1.25,0);
}



/*

	object_time = 0;
	object_name = "default_object";
	object_position = [0,0];
	object_size = [1,1];
	object_angle = 0;

*/