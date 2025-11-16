if (global.pop_up)
{
	if (instance.pop_up_id == 2)
	{
		display_text = true;
		image_alpha = clamp(image_alpha + 0.1, 0, 1);	
	}
		
	x = lerp(x,moved_position_x,0.1);
}else
{
	display_text = false;
	image_alpha = clamp(image_alpha - 0.05, 0, 1);	
	x = lerp(x,original_x,0.1);
}
	
if (instance.pop_up_id != 2)
{
	image_alpha = clamp(image_alpha - 0.05, 0, 1);	
	display_text = false;	
}

if (mouse_check_button(mb_left) && position_meeting(mouse_x,mouse_y,id) && image_alpha != 0)
{
	dragging = true;
}

if (mouse_check_button_released(mb_left))
{
	dragging = false;
}

if (dragging)
{
	global.volume = clamp((mouse_x - x) / (sprite_width),0,1);
}

if (global.volume < 0.01)
{
	global.volume = 0;	
}

audio_master_gain(global.volume);
//show_debug_message(global.volume);

//handle.x = x + sprite_width * (global.volume);