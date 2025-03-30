if keyboard_check_pressed(ord("O")) && _manager.shortcuts_on || !position_meeting(mouse_x,mouse_y,id) && mouse_check_button_pressed(mb_left) && !hidden
{
	//visible = !visible;
	hidden = !hidden;
}

if hidden
{
	image_alpha	= 0;
	x = hidden_x;
	y = hidden_y;
}else
{
	image_alpha = 1;

	x = default_x;
	y = default_y;
}

name.x = x + add_x_position;
name.y = y + sprite_width * 1/6;
description.x = x + add_x_position;
description.y = y + sprite_width * 2/6;
lenght.x = x + add_x_position;
lenght.y = y + sprite_width * 3/6;
difficulty.x = x + add_x_position;
difficulty.y = y + sprite_width * 4/6;
save.x = x + sprite_width * 3/3 - 25;
save.y = y + sprite_width * 4/5 + 50;
load.x = x + sprite_width * 1/3 + 35;
load.y = y + sprite_width * 4/5 + 50;

if set_values
{
	name.text = level_name;
	name.last_valid_input = level_name;
	
	description.text = level_description;
	description.last_valid_input = level_description;
	
	lenght.text = level_lenght;
	lenght.last_valid_input = level_lenght;
	
	difficulty.text = level_difficulty;
	difficulty.last_valid_input = level_difficulty;
	
	set_values = false;
}else
{
	level_name = name.text;
	level_description = description.text;
	level_lenght = lenght.text;
	level_difficulty = difficulty.text;
}
	
	