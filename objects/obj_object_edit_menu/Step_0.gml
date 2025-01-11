if !setup
{
	with(x_pos)
	{
		image_xscale = 2;
		x -= sprite_width; //adjust the input field even more
		depth = depth - 1;
		max_text_lenght = 4;
	}
	x_pos.text = string(object_x);
	
	with (y_pos)
	{
		image_xscale = 2;
		x -= sprite_width; //adjust the input field even more
		depth = depth - 1;
		max_text_lenght = 4;		
	}
	y_pos.text = string(object_y);
	
	with (rotation)
	{
		image_xscale = 2;
		x -= sprite_width; //adjust the input field even more
		depth = depth - 1;
		max_text_lenght = 3;		
	}
	rotation.text = string(object_rotation);
	
	setup = true;
}

object_x = x_pos.text;
object_y = y_pos.text;
object_rotation = rotation.text;

if !position_meeting(mouse_x,mouse_y,id) && mouse_check_button_pressed(mb_left)
{
	parent_id.edit_menu_popup = false;
	parent_id.object_x = object_x;
	parent_id.object_y = object_y;
	parent_id.object_rotation = object_rotation;
	show_debug_message("destroyed");
	
	//foreach iohng
	
	for (var i = 0; i < array_length(delete_list); i++)
	{
		instance_destroy(delete_list[i]);
	}
	//instance_destroy();	
}else spawn_time--;



//show_debug_message(parent_id.x);