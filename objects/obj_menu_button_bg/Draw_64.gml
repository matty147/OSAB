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


		//draw_text(x + sprite_width / 2, text_y, filename_name(string(instance.save[instance.id_of_button_selected])));
		draw_text(x + sprite_width / 2, text_y, name);


	}
	
}


if level_info
{
	
	//show_debug_message("last: " + string(last_id_of_button_selected) + "new: " + string(instance.id_of_button_selected));
	
	if instance.id_of_button_selected != last_id_of_button_selected
	{
		loaded_level_data = false;
		last_id_of_button_selected = instance.id_of_button_selected;		
		//show_debug_message("update");
	}
	
	if !loaded_level_data
	{
		loaded_level_data = true;
		data = [];
		var file = file_text_open_read(instance.save[instance.id_of_button_selected])//file_text_open_read(instance.save[instance.id_of_button_selected] + ".osab");
		
			while (!file_text_eof(file))
			{
				var line = file_text_readln(file);
				//show_debug_message("input: " + string(line));
		
				if string_trim(line) != ""
				{
			
				var	_path_parts = string_split(line, ",");
			
					if string_trim(line) == "-"
					{
						break;
					}
				
					if _path_parts[0] != "//"
					{
						array_push(data,_path_parts[1]);
					}
				
					//show_debug_message("processed:" + string(line));
				}
			}
				file_text_close(file);
			//show_debug_message("finished");
			
			if array_length(data) >= 4
			{			
				
				if string_length(string(data[2])) > 80
				{
					data[2] = string_copy(string(data[2]), 1, 80) + "...";
				}
				
				_id = data[0];
				name = data[1];
				description = data[2];
				lenght = data[3];
				diff = data[4];
			}else{
				_id = "-";
				name = "-";
				description = "-";
				lenght = "-";
				diff = "-";
			}
			
			if display_image != ""
			{
				sprite_delete(display_image);	
			}
			
			var file_location = filename_dir(string(instance.save[instance.id_of_button_selected]));
			//show_debug_message(file_location);
			var png_path = file_location + "\\*.png";
			var jpg_path = file_location + "\\*.jpg";
	
			show_debug_message("png path: " + string(png_path));
			show_debug_message("jpg path: " + string(jpg_path));
	
			var search = file_find_first(png_path, fa_directory);
			
			if search == ""
			{
				//show_debug_message("no");
				search = file_find_first(jpg_path, fa_directory);
				file_find_close();
			}
	
			show_debug_message(search);
			show_debug_message(string(file_location) + string(search));
			if search != ""
			{
				display_image = sprite_add(string(file_location) + "\\" + string(search),0,false,false,0,0);
		
				if (display_image != -1) {
			
					var max_width = sprite_width * 3/4;
					var max_height = 200;
			
					var spr_width = sprite_get_width(display_image);
					var spr_height = sprite_get_height(display_image);
			
					picture_scale_x = max_width / spr_width;
					picture_scale_y = max_height / spr_height
					
			    } else {
					display_image = "";
			        show_debug_message("Failed to load sprite.");
			    }
		
		}else display_image = "";
		
		if sound_id != "" 
		{
			audio_stop_sound(sound_id);
			audio_destroy_stream(sound_id);
		}			
					
		var music_path = file_location + "\\*.ogg";
			
		search = file_find_first(music_path, fa_directory);
		file_find_close();
	
		show_debug_message("found song: " + string(search));

		if search != ""
		{
			sound_id = audio_create_stream(filename_dir(music_path) + "\\" + search);
			audio_play_sound(sound_id, 1, false,1);
		}
		
		
	}
	
	draw_set_font(fnt_default);
	
	draw_set_halign(fa_left);
	draw_text_ext_transformed(x + margin_x,230,string(description),20,230,2,2,0);	
	draw_set_halign(fa_center);
	draw_text_transformed(x + sprite_width / 4 ,325,"lenght: " + string(lenght),2,2,0);	
	draw_text_transformed(x + sprite_width / 4 * 3 ,325,"difficulty: " + string(diff),2,2,0);
	
	if display_image != ""
	{
		draw_sprite_ext(display_image,0,sprite_width / 4,400,picture_scale_x,picture_scale_y,0,c_white,1);
	}
}