//draw_set_color(c_white);
//draw_set_halign(fa_center);

//if display_text
//{
//	draw_line(x + margin_x, line_y, x + sprite_width - margin_x, line_y);

//	// Text
//	draw_set_font(fnt_large);

//	if (instance.menu_id == 0) {
//	    draw_text(x + sprite_width / 2, text_y, "Welcome");
//	} else if (instance.menu_id == 2) || (instance.menu_id == 20) || (instance.menu_id == 21) || (instance.menu_id == 22){
//		if hidden
//		{
//			if instance.menu_id == 20
//			{
//				draw_text(x + sprite_width / 2, text_y, "Game setting");
//			}else if instance.menu_id == 21
//			{
//				draw_text(x + sprite_width / 2, text_y, "Graphics setting");
//			}else if instance.menu_id == 22
//			{
//				draw_text(x + sprite_width / 2, text_y, "Audio setting");
//			}
			
//		}else draw_text(x + sprite_width / 2, text_y, "Options");
//	} else if (instance.menu_id == 1){


//		draw_text(x + sprite_width / 2, text_y, string(instance.save[instance.id_of_button_selected]));


//	}
	
//}

//if level_info
//{
	
//	//show_debug_message("last: " + string(last_id_of_button_selected) + "new: " + string(instance.id_of_button_selected));
	
//	if instance.id_of_button_selected != last_id_of_button_selected
//	{
//		loaded_level_data = false;
//		//show_debug_message("update");
//	}

//	last_id_of_button_selected = instance.id_of_button_selected;
	
//	if !loaded_level_data
//	{
//		data = [];
//		var file = file_text_open_read(instance.save[instance.id_of_button_selected] + ".osab");
		
//			while (!file_text_eof(file))
//			{
//				var line = file_text_readln(file);
//				//show_debug_message("input: " + string(line));
		
//				if string_trim(line) != ""
//				{
			
//				var	_path_parts = string_split(line, ",");
			
//					if string_trim(line) == "-"
//					{
//						break;
//					}
				
//					if _path_parts[0] != "//"
//					{
//						array_push(data,_path_parts[1]);
//					}
				
//					//show_debug_message("processed:" + string(line));
//				}
//			}
//				file_text_close(file);
//			//show_debug_message("finished");
			
//			if array_length(data) >= 4
//			{			
				
//				if string_length(string(data[2])) > 80
//				{
//					data[2] = string_copy(string(data[2]), 1, 80) + "...";
//				}
//				_id = data[0];
//				name = data[1];
//				description = data[2];
//				lenght = data[3];
//				diff = data[4];
//			}else{
//				_id = "-";
//				name = "-";
//				description = "-";
//				lenght = "-";
//				diff = "-";
//			}
//		loaded_level_data = true;
//	}
	
//	draw_set_font(fnt_default);
	
//	draw_set_halign(fa_left);
//	draw_text_ext_transformed(x + margin_x,230,string(description),20,230,2,2,0);	
//	draw_set_halign(fa_center);
//	draw_text_transformed(x + sprite_width / 4 ,325,"lenght: " + string(lenght),2,2,0);	
//	draw_text_transformed(x + sprite_width / 4 * 3 ,325,"difficulty: " + string(diff),2,2,0);
//	draw_rectangle(sprite_width / 4,400,sprite_width, 600,false)
	
//}