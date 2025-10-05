if mouse_check_button_pressed(mb_left)
{
	// for some reason it sometimes dosent select the right one? usually happens when the lower one is in the same lane as the upper one.
	editor_object = instance_position(mouse_x,mouse_y,obj_editor_enemy); 

	if editor_object != -4
	{
		
		valid_editor_object = editor_object;
		
		inp_time.visible = true; 
		inp_name.visible = true; 
		inp_pos_x.visible = true;
		inp_pos_y.visible = true;
		inp_size_x.visible = true;
		inp_size_y.visible = true;
		inp_angle.visible = true;
		
		display_name = valid_editor_object.object_name;
		show_debug_message(editor_object);		
	}else
	{
		show_debug_message("no object present");
		editor_object = valid_editor_object;
	}
}