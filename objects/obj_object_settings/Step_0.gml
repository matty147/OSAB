/// @description automaticly check and toggle input box visibility
function update_inputbox_visibility() {
    var obj_len  = array_length(objects);
    var meta_len = array_length(metas);

    var show_objects = (state == CUR_EDITING.OBJECT);
    var show_metas   = (state == CUR_EDITING.LEVEL_META);

    // object inputs
    for (var i = 0; i < obj_len; i++) {
        objects[i].visible = show_objects;
    }

    // meta inputs
    for (var i = 0; i < meta_len; i++) {
        metas[i].visible = show_metas;
    }
}


if (state == CUR_EDITING.LEVEL_META)
{
	for (var i = 0; i < array_length(metas);i++)
	{
		metas[i].visible = true;
	}

} else if (state == CUR_EDITING.OBJECT)
{
	if (array_length(set_data) != 0)
	{
	
		switch (set_data[0])
		{
			case "time":
				valid_editor_object.object_time = set_data[1];
					break;
			case "name":
				valid_editor_object.object_name = set_data[1];
					break;
			case "pos_x":
				valid_editor_object.object_position[0] = set_data[1];
					break;
			case "pos_y":
				valid_editor_object.object_position[1] = set_data[1];
					break;
			case "size_x":
				valid_editor_object.object_size[0] = set_data[1];
					break;
			case "size_y":
				valid_editor_object.object_size[1] = set_data[1];
					break;
			case "angle":
				valid_editor_object.object_angle = set_data[1];
					break;
			default:
				show_debug_message($"wrong key: {set_data[0]}");
					break;
		}
	
		show_debug_message($"updated {set_data[0]} with {set_data[1]}");
	
		set_data = [];	
	}
}else if (state == CUR_EDITING.OPTIONS)
{
	
}


// CUR_EDITING.OBJECT
if (mouse_check_button_pressed(mb_left))
{
	editor_object = instance_position(mouse_x,mouse_y,obj_editor_enemy); 

	if (editor_object != -4)
	{

		state = CUR_EDITING.OBJECT;
		
		valid_editor_object = editor_object;
		
		for (var i = 0; i < array_length(objects); i++) {
		    var obj = objects[i];
		    
		    obj.visible = true;
		    
		    var key = obj.return_key;
		    
		    var def_value = "";
		    
		    switch (key)
		    {
		    	case "time":
		    		def_value = valid_editor_object.object_time;
	    		break;
		    	
		    	case "name":
		    		def_value = valid_editor_object.object_name;
		    	break;
		    	
		    	case "pos_x":
		    		def_value = valid_editor_object.object_position[0];
		    	break;
		    	
		    	case "pos_y":
			    	def_value = valid_editor_object.object_position[1];
		    	break;
		    	
		    	case "size_x":
					def_value = valid_editor_object.object_size[0];
		    	break;
		    	
		    	case "size_y":
		    		def_value = valid_editor_object.object_size[1];
		    	break;
		    	
    		 	case "angle":
    		 		def_value = valid_editor_object.object_angle;
		    	break;
		    	
		    	default:
		    		def_value = "default";
	    		break;
		    	
		    }
		    
		    obj.t_ = def_value;
		    obj.text = def_value;
		    obj.default_var = def_value;
		}
	}else
	{
		editor_object = valid_editor_object;
	}
}

update_inputbox_visibility();

// show_debug_message($"state: {state}");
// show_debug_message($"bool: {state == CUR_EDITING.OBJECT}");