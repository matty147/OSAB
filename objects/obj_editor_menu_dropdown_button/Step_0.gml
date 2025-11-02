function load()
{
	
	
}

if mouse_check_button_pressed(mb_left) && position_meeting(mouse_x,mouse_y, id)
{
	show_debug_message($"pressed {display_text} button");
	switch (display_text)
	{
		case "Save":
			var mng = instance_find(manager_editor,0);
			mng.save_level = 1;
			break;
			
		case "Open":
			break;
		
		case "Options":
			break;

		case "Exit":
			room_goto(main_menu);
			break;

		default:
			show_debug_message("invalid button id");
			break;
	}
	
}
