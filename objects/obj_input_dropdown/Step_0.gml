
// if (live_call()) return live_result;

if (mouse_check_button_pressed(mb_left))
{
	if (position_meeting(mouse_x,mouse_y, obj_input_dropdown))
	{
		open = !open;
	}else{
	    open = false;
	}
	
}

if (open)
{
	if (inp_menu == noone)
	{	
		inp_menu = instance_create_layer(x,y + sprite_height ,"objects",obj_input_dropdown_bg);
	    
		for (var o = 0; o < option_numbers - 1; o++)
		{
			var inp_but = instance_create_layer(x,inp_menu.y + 22 + (button_space + 32) * o,"objects",obj_input_dropdown_button);
			inp_but.depth = inp_menu.depth - 1;
			inp_but.image_xscale = 1;
			inp_but.image_yscale = 0.5;
			inp_but.display_text = option_text[o];
			inp_but.parent = id;
		}
	}
}else 
{
	if (inp_menu != noone)
	{
		instance_destroy(inp_menu);
		inp_menu = noone;
	}
	
	with (obj_input_dropdown_button) {instance_destroy();}
}

if (update_value)
{
    update_value = false;
    
    object_settings.update_state = true;
    
    switch (inp_dropdown_text)
    {
        case "None":
            object_settings.cur_move_type = MOVE_TYPE.NONE;
        break;
        
        case "Bounce":
            object_settings.cur_move_type = MOVE_TYPE.BOUNCE;
        break;
        
        case "Position":
            object_settings.cur_move_type = MOVE_TYPE.POSITION;
        break;
        
        case "Scale":
            object_settings.cur_move_type = MOVE_TYPE.SCALE;
        break;
        
        default:
            object_settings.cur_move_type = MOVE_TYPE.NONE;
    }
}