if !setup
{
	with(x_pos)
	{
		image_xscale = 2;
		x -= sprite_width; //adjust the input field even more
		depth = depth - 1;
		max_text_lenght = 4;
		numeric_check = true;
	}
	x_pos.text = string(object_x);
	
	with (y_pos)
	{
		image_xscale = 2;
		x -= sprite_width; //adjust the input field even more
		depth = depth - 1;
		max_text_lenght = 4;
		numeric_check = true;
	}
	y_pos.text = string(object_y);
	
	with (rotation)
	{
		image_xscale = 2;
		x -= sprite_width; //adjust the input field even more
		depth = depth - 1;
		max_text_lenght = 3;
		numeric_check = true;
	}
	rotation.text = string(object_rotation);
	
	with (x_scale)
	{
		image_xscale = 2;
		x -= sprite_width; //adjust the input field even more
		depth = depth - 1;
		max_text_lenght = 3;
		numeric_check = true;
	}
	x_scale.text = string(object_x_scale);
	
	with (y_scale)
	{
		image_xscale = 2;
		x -= sprite_width; //adjust the input field even more
		depth = depth - 1;
		max_text_lenght = 3;
		numeric_check = true;
	}
	y_scale.text = string(object_y_scale);
	
	with (time)
	{
		image_xscale = 2;
		x -= sprite_width; //adjust the input field even more
		depth = depth - 1;
		max_text_lenght = 3;	
		numeric_check = true;
	}
	time.text = string(object_time);
	
	with (check_box)
	{
		x -= sprite_width; //adjust the input field even more
		depth = depth - 1;
	}
	 check_box.state = show_advanced_option;
	
	setup = true;
}

object_x = x_pos.text;
object_y = y_pos.text;
object_rotation = rotation.text;
object_x_scale = x_scale.text;
object_speed = y_scale.text;
//object_y_scale = y_scale.text;
object_time = time.text;

show_advanced_option = check_box.state;

if show_advanced_option
{
	show_debug_message("Advanced options");
	image_xscale = 7;
}else image_xscale = 3.5;

if !position_meeting(mouse_x,mouse_y,id) && mouse_check_button_pressed(mb_left)
{
	parent_id.edit_menu_popup = false;
	parent_id.object_x = object_x;
	parent_id.object_y = object_y;
	parent_id.object_rotation = object_rotation;
	parent_id.object_x_scale = object_x_scale;
	parent_id.object_y_scale = object_y_scale;
	parent_id.object_speed = object_speed;
	parent_id.start_time = object_time; // dosent change time for some reason???	
	show_debug_message("destroyed");
	
	//foreach iohng
	
	for (var i = 0; i < array_length(delete_list); i++)
	{
		instance_destroy(delete_list[i]);
	}
	//instance_destroy();	
}else spawn_time--;

//show_debug_message(parent_id.x);