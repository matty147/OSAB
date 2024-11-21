draw_set_color(c_white);
draw_set_halign(fa_center);

if display_text
{
	draw_line(x + margin_x, line_y, x + sprite_width - margin_x, line_y);

	// Text
	draw_set_font(fnt_large);

	if (instance.menu_id == 0) {
	    draw_text(x + sprite_width / 2, text_y, "Welcome");
	} else if (instance.menu_id == 2) || (instance.menu_id == 20) || (instance.menu_id == 21) || (instance.menu_id == 22){
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


		draw_text(x + sprite_width / 2, text_y, string(instance.save[instance.id_of_button_selected]));


	}
	
}

if level_info
{
		var file = file_text_open_read(instance.save[instance.id_of_button_selected] + ".osab");
		
			while (!file_text_eof(file))
			{
				var line = file_text_readln(file);
				show_debug_message("input: " + string(line));
		
				if string_trim(line) != ""
				{
			
				var	_path_parts = string_split(line, ",");
			
					if string_trim(line) == "-"
					{
						break;
					}
				
					show_debug_message("lol: " + string(_path_parts[0]));
					show_debug_message("lol: " + string(_path_parts[1]));
					show_debug_message("lol: " + string(_path_parts[2]));
					show_debug_message("lol: " + string(_path_parts[3]));
					if _path_parts[0] != "//"
					{
						_id = string(_path_parts[0]);
						name = string(_path_parts[1]);
						description = string(_path_parts[2]);
						lenght = string(_path_parts[3]);
						diff = string(_path_parts[4]);
					}
				
					show_debug_message("processed:" + string(line));
				}
			}
				file_text_close(file);
			show_debug_message("finished");
	
	
	//draw_set_halign(fa_left);
	draw_text(x + sprite_width / 2 ,190,"description: " + string(description))	
}