
if move
{
	if global.pop_up
	{
		if hidden
		{
			display_text = true;
			image_alpha = clamp(image_alpha + 0.1, 0, 1);	
		}
		
		x = lerp(x,moved_position_x,0.1);
	}else
	{
		if hidden
		{
			display_text = false;
			image_alpha = clamp(image_alpha - 0.05, 0, 1);	
		}
		
		x = lerp(x,original_x,0.1);
	}
}