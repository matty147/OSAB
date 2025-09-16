if mouse_check_button_pressed(mb_left)
{
	editor_object = instance_place(mouse_x,mouse_y,obj_editor_enemy);
	
	if editor_object != -4
	{
		valid_editor_object = editor_object;
		
		display_name = valid_editor_object.object_name;
		show_debug_message(editor_object);		
	}else
	{
		show_debug_message("no object present");
		editor_object = valid_editor_object;
	}
}