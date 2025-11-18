// if (live_call()) return live_result;

// automaticly check and toggle input box visibility

// show_debug_message(instance_number(obj_editor_enemy));

function update_inputbox_visibility() {
    var obj_len  = array_length(objects);
    var meta_len = array_length(metas);

    var show_objects = (state == CUR_EDITING.OBJECT);
    var show_metas   = (state == CUR_EDITING.LEVEL_META);

    inp_dropdown.visible = show_objects;

    //object inputs
    for (var i = 0; i < obj_len; i++) {
    	if (show_objects && cur_move_type != MOVE_TYPE.NONE)
    	{
	        if (i < 11) {
	        	objects[i].visible = show_objects;
	    	}
    	}else objects[i].visible = show_objects;
    }

    // meta inputs
    for (var i = 0; i < meta_len; i++) {
        metas[i].visible = show_metas;
    }
}


if (state == CUR_EDITING.LEVEL_META)
{
	if (update_meta)
	{
		update_meta = false;
		for (var i = 0; i < array_length(metas);i++)
		{
			var obj = metas[i];
			
			metas[i].visible = true;
			
		    var key = obj.return_key;
			    
			var def_value = "";
			
			var ed_manager = instance_find(manager_editor,0);
			
			switch (key)
			{
				case "id":
					def_value = ed_manager.editor_meta[? "id"];
				break;
				
				case "name":
					def_value = ed_manager.editor_meta[? "name"];
				break;
				
				case "desc":
					def_value = ed_manager.editor_meta[? "desc"];
				break;
				
				case "leng":
					def_value = ed_manager.editor_meta[? "leng"];
				break;
				
				case "diff":
					def_value = ed_manager.editor_meta[? "diff"];
				break;
				
				default:
					show_debug_message($"invalid key: {key}");
			}
			
		    obj.t_ = def_value;
		    obj.text = def_value;
		    obj.default_var = def_value;
		}
	}
} else if (state == CUR_EDITING.OBJECT)
{
	if (array_length(set_data) != 0)
	{
	
		update_display_object = true;
	
		switch (set_data[0])
		{
			case "time":
			
			if (is_numeric(set_data[1]))
			{
				valid_editor_object.object_time = real(set_data[1]);
				valid_editor_object.editor_object_time = real(set_data[1]);
				
				// show_debug_message(set_data[1]);
				
				
				with (valid_editor_object)
				{
					editor_x = timeline.x + timeline.line_amount_w * object_time;
					position = round((x - timeline.x) / timeline.line_amount_w) - timeline.timeline_offset;
				}
			}
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
			
			// did not manage in time :/		
			// case "speed":
			// 	def_value = ed_manager.editor_meta[? "speed"];
			// 		break;
			
			// case "image_alpha":
			// 	def_value = ed_manager.editor_meta[? "speed"];
			// 		break;
			
			// case "survive_speed":
			// 	def_value = ed_manager.editor_meta[? "speed"];
			// 		break;
			
			// case "show_hitbow":
			// 	def_value = ed_manager.editor_meta[? "speed"];
			// 		break;	
			
			// case "spline":
			// 	def_value = ed_manager.editor_meta[? "speed"];
			// 		break;
			
			// case "positions":
			// 	def_value = ed_manager.editor_meta[? "speed"];
			// 		break;
			
			// case "gravity":
			// 	def_value = ed_manager.editor_meta[? "speed"];
			// 		break;
			
			// case "friction":
			// 	def_value = ed_manager.editor_meta[? "speed"];
			// 		break;
			
			// case "end_scale":
			// 	def_value = ed_manager.editor_meta[? "speed"];
			// 		break;
			
			// case "scale_speed":
			// 	def_value = ed_manager.editor_meta[? "speed"];
			// 		break;		
			
			default:
				show_debug_message($"wrong key: {set_data[0]}");
					break;
		}
	
		show_debug_message($"updated {set_data[0]} with {set_data[1]}");
	
		set_data = [];	
	}
	
	if (keyboard_check_pressed(vk_delete))
	{
		if (instance_exists(valid_editor_object))
		{
			with (valid_editor_object)
			{
				instance_destroy();
				instance_destroy(obj_display_object);
				valid_editor_object = noone;
			}
		}
	}
}else if (state == CUR_EDITING.OPTIONS)
{
	
}

if (update_state)
{
	update_state = false;
	
	var toggle_active = cur_move_type;

	for (var o = 11;o < array_length(inp_objects_settings);o++)
	{
		var obj = objects[o];
		var data = inp_objects_settings[o];
		 
		 obj.visible = (data[7] == toggle_active);
	}
}

// CUR_EDITING.OBJECT
if (mouse_check_button_pressed(mb_left))
{
	editor_object = instance_position(mouse_x,mouse_y,obj_editor_enemy); 

	if (editor_object != -4)
	{

		state = CUR_EDITING.OBJECT;
		
		if (instance_exists(valid_editor_object))
		{
			valid_editor_object.selected = false;
		}
		
		valid_editor_object = editor_object;
		
		valid_editor_object.selected = true;
		
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