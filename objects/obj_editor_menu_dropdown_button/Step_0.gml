function fnc_move_file(dest_path, ogg_path, image_path)
{
    show_debug_message($"{dest_path}, {ogg_path}, {image_path}");

    var out = move_files(ogg_path, image_path, dest_path);

    if (out == 1)
        show_debug_message("zip success");
    else
        show_debug_message("zip failed: " + string(out));
}

function fnc_zip_files(folder_path, audio, image, osab)
{
	var out = zip_folder(folder_path, audio,image, osab);

    if (out == 1)
        show_debug_message("zip success");
    else
        show_debug_message("zip failed: " + string(out));
}


if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x,mouse_y, id))
{
	show_debug_message($"pressed {display_text} button");
	switch (display_text)
	{
		case "Save":
			var mng = instance_find(manager_editor,0);
			mng.save_level = 1;
			break;
			
		case "Open":
			var mng = instance_find(manager_editor,0);
			mng.load_level = 1;
			break;
		
		case "Options":
			var inp_setting = instance_find(obj_object_settings,0);
			with (inp_setting)
			{
				state = CUR_EDITING.LEVEL_META;
				update_meta = true;
				// state = CUR_EDITING.OPTIONS;
			}
			break;

		case "Export":
			show_debug_message("export");
				
			// data that needs to be fetched
			var ogg   = get_open_filename_ext(".ogg|*.ogg","", true,"Select an ogg audio file");
    		var dimage = get_open_filename_ext(".png|*.png","",true,"Select an image file");
			var folder = working_directory + "exports/level"; // replace with the level name
			
			if (!directory_exists(folder))
			{
				directory_create($"{folder}/level");
			}
			
			show_debug_message($"this is the ogg name: {filename_name(ogg)}");
		
			var a = folder;
			var b = "audio.ogg";
			var c = "image.png";
			var d = "fuck.osab";
	
			fnc_move_file(folder, ogg, dimage);
			fnc_zip_files(a,b,c,d);
			
			file_delete(working_directory + "exports/audio.ogg");
			file_delete(working_directory + "exports/image.png");
			
			break;


		case "Exit":
			room_goto(main_menu);
			break;

		default:
			show_debug_message("invalid button id");
			break;
	}
	
	alarm[0] = 1; 
	
}
