draw_set_color(c_white);
draw_set_halign(fa_center);

if (display_text)
{
	draw_line(x + margin_x, line_y, x + sprite_width - margin_x, line_y);

	// Text
	draw_set_font(fnt_large);

	if (instance.menu_id == 0) {
	    text = "Welcome";
	} else if (instance.menu_id == 2) || (instance.menu_id == 20) || (instance.menu_id == 21) || (instance.menu_id == 22){
		if (hidden)
		{
			if (instance.menu_id == 20)	
			{
				text = "Game settings";
			}else if (instance.menu_id == 21)
			{
				text = "Audio settings";
			}else if (instance.menu_id == 22)
			{
				text = "Credits";
			}
			
		}else text = "Options";
	} else if (instance.menu_id == 1){
		text = string(name);
	}
	
	
	//show_debug_message("name: " + string(text));
	
	var repeat_numb = 0;
	
	while (string_width(string(text)) * text_size > sprite_width)
	{
	
		repeat_numb++;
	
		if (string_width(string(text)) * text_size > sprite_width - 50)
		{
			if (text_size > 0.5)
			{
				text_size -= 0.1;
			}
			show_debug_message(string_length(text));
		}else if (text_size < 1 && string_width(string(text)) * (text_size + 0.1) < sprite_width - 50)
		{
			text_size += 0.1;
		}
		
		if (repeat_numb > 10)
		{
			break;	
		}
	}
	
	draw_text_transformed(x + sprite_width / 2, text_y, text,text_size,text_size,0);
	
	if (text == "Credits")
	{
		draw_set_halign(fa_left);
		draw_text_transformed(x + 25,y + 150,"Programming: Inkk_ing",0.7,0.7,0);
		draw_text_transformed(x + 25,y + 200,"Art & Website: Krooby",0.7,0.7,0);
		draw_text_transformed(x + 25,y + 270,"Music used:",0.75,0.75,0);
		draw_text_transformed(x + 30,y + 320,"Yooh - MariannE",0.5,0.5,0);
		draw_text_transformed(x + 30,y + 350,"Tanciky - Energy synergy Matrix",0.5,0.5,0);
		draw_text_transformed(x + 30,y + 380,"HyuN - Disorder",0.5,0.5,0);
		draw_text_transformed(x + 30,y + 410,"fur:trash - what the devils?????",0.5,0.5,0);
		draw_text_transformed(x + 30,y + 440,"Polyphia - The Audacity",0.5,0.5,0);
	}else if (text == "Audio settings")
	{
		draw_set_halign(fa_left);
		draw_text_transformed(x + 25,y + 193,"Global volume",0.5,0.5,0);
	}
}


if (level_info)
{
	
	//show_debug_message("last: " + string(last_id_of_button_selected) + "new: " + string(instance.id_of_button_selected));
	
	if (instance.id_of_button_selected != last_id_of_button_selected && instance.selected_scrollable_button)
	{
		loaded_level_data = false;
		last_id_of_button_selected = instance.id_of_button_selected;		
		//show_debug_message("update");
	}
	
	if (!loaded_level_data && true)
	{
		loaded_level_data = true;
		var level_data = undefined;	

			var json = "";
		
			var file_name = file_text_open_read(instance.save[instance.id_of_button_selected]);
	
			while(file_text_eof(file_name) == false)
			{
				var line = file_text_readln(file_name);
				if (string_trim(line) == "},")
				{
					json += "}\n";
					json += "}";
					break;
				}else json += line;
			}
		
			file_text_close(file_name);

			// show_debug_message("leveldata:  " + string(json));
		
			level_data = json_parse(json);
		
			if (level_data != undefined)
			{			
				
				var meta = level_data.meta;
				
				if (string_length(string(meta.description)) > 80)
				{
					meta.description = string_copy(string(meta.description), 1, 80) + "...";
				}
				
				_id = string(meta.id);
				name = string(meta.name);
				description = string(meta.description);
				lenght = string(meta.lenght);
				diff = string(meta.diff);
			}else{
				_id = "-";
				name = "-";
				description = "-";
				lenght = "-";
				diff = "-";
			}
			
			if (display_image != "")
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
			
			if (search == "")
			{
				//show_debug_message("no");
				search = file_find_first(jpg_path, fa_directory);
				file_find_close();
			}
	
			show_debug_message(search);
			show_debug_message(string(file_location) + string(search));
			if (search != "")
			{
				display_image = sprite_add(string(file_location) + "\\" + string(search),0,false,false,0,0);
		
				if (display_image != -1) {
			
					var max_width = sprite_width * 3/4;
					var max_height = 200;
			
					var spr_width = sprite_get_width(display_image);
					var spr_height = sprite_get_height(display_image);
			
					picture_scale_x = max_width / spr_width;
					picture_scale_y = max_height / spr_height;
					
			    } else {
					display_image = "";
			        show_debug_message("Failed to load sprite.");
			    }
		
		}else display_image = "";
		
		if (sound_id != "" )
		{
			audio_stop_sound(sound_id);
			audio_destroy_stream(sound_id);
		}			
					
		var music_path = file_location + "\\*.ogg";
			
		search = file_find_first(music_path, fa_directory);
		file_find_close();
	
		show_debug_message("found song: " + string(search));

		if (search != "")
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
	
	if (display_image != "")
	{
		draw_sprite_ext(display_image,0,sprite_width / 4,375,picture_scale_x,picture_scale_y,0,c_white,1);
	}
}