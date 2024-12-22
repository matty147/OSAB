if !position_meeting(mouse_x,mouse_y,id) && mouse_check_button_pressed(mb_left)
{
	parent_id.edit_menu_popup = false;
	show_debug_message("destroyed");
	instance_destroy();	
}else spawn_time--;

show_debug_message(parent_id.x);