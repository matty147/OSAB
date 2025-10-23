if array_length(set_data) != 0
{
	
	switch (set_data[0])
	{
		case "time":
			valid_editor_object.object_time = set_data[1]
				break;
		case "name":
			valid_editor_object.object_name = set_data[1]
				break;
		case "pos_x":
			valid_editor_object.object_position[0] = set_data[1]
				break;
		case "pos_y":
			valid_editor_object.object_position[1] = set_data[1]
				break;
		case "size_x":
			valid_editor_object.object_size[0] = set_data[1]
				break;
		case "size_y":
			valid_editor_object.object_size[1] = set_data[1]
				break;
		case "angle":
			valid_editor_object.object_angle = set_data[1]
				break;
		default:
			show_debug_message($"wrong key: {set_data[0]}")
			break
	}
	
	show_debug_message($"updated {set_data[0]} with {set_data[1]}");
	
	set_data = [];	
}

if mouse_check_button_pressed(mb_left)
{
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
		
		inp_time.t_ = valid_editor_object.object_time; 
		inp_name.t_ = valid_editor_object.object_name; 
		inp_pos_x.t_ = valid_editor_object.object_position[0];
		inp_pos_y.t_ = valid_editor_object.object_position[1];
		inp_size_x.t_ = valid_editor_object.object_size[0];
		inp_size_y.t_ = valid_editor_object.object_size[1];
		inp_angle.t_ = valid_editor_object.object_angle;
		
		inp_time.text = valid_editor_object.object_time;
		inp_name.text  =  valid_editor_object.object_name;
		inp_pos_x.text  =  valid_editor_object.object_position[0];
		inp_pos_y.text  =  valid_editor_object.object_position[1];
		inp_size_x.text  = valid_editor_object.object_size[0];
		inp_size_y.text  = valid_editor_object.object_size[1];
		inp_angle.text  = valid_editor_object.object_angle;
		
		inp_time.default_var = valid_editor_object.object_time;
		inp_name.default_var  =  valid_editor_object.object_name;
		inp_pos_x.default_var  =  valid_editor_object.object_position[0];
		inp_pos_y.default_var  =  valid_editor_object.object_position[1];
		inp_size_x.default_var  = valid_editor_object.object_size[0];
		inp_size_y.default_var  = valid_editor_object.object_size[1];
		inp_angle.default_var  = valid_editor_object.object_angle;
		
		show_debug_message(inp_time.text);
		
		display_name = valid_editor_object.object_name;
		show_debug_message(editor_object);		
	}else
	{
		show_debug_message("no object present");
		editor_object = valid_editor_object;
	}
}