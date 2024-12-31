object_x = x_pos.text;
object_y = y_pos.text;
object_rotacion = 0;

if !position_meeting(mouse_x,mouse_y,id) && mouse_check_button_pressed(mb_left)
{
	parent_id.edit_menu_popup = false;
	show_debug_message("destroyed");
	
	//foreach iohng
	
	instance_destroy(x_pos); // delete it better
	instance_destroy(y_pos); // delete it better
	instance_destroy();	
}else spawn_time--;



//show_debug_message(parent_id.x);