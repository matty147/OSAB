if (live_call()) return live_result;

// ghosts
for (var i = 0; i < 4;i++)
{
	if (i >= array_length(global.input_map) && position_meeting(x + (i * 74 + 16) + 48,y,id))
	{
		if (array_length(global.gamepads) > 0)
		{
	    	sprite = (floor((global.runtime) / 30) % 2 == 0) ? spr_keyboard_icon : spr_controller_icon;
		}else sprite = spr_keyboard_icon;
		
		draw_sprite_ext(sprite, 0, x + (i * 74 + 16), y,1,1,0,c_white,0.5);
		draw_text_color(x + (i * 74 + 16) + 32,y + 67 ,$"P{i + 1}",c_white,c_white,c_white,c_white,1);
		
	}
}

// show_debug_message(global.gamepads);

// real
for (var i = 0; i < array_length(global.input_map);i++)
{
	if (position_meeting(x + (i * 74 + 16) + 48,y,id))
	{
	    var input = global.input_map[i];
	    
	    // show_debug_message(input);
	    
	    if (is_array(input))
	    {
	    	input = input[0];
	    }
	    
	    var sprite = Sprite76;
	    
	    switch (input)
	    {
	        case INPUT_METHODS.KEYBOARDS:
	                sprite = spr_keyboard_icon;
	            break;
	        
	        case INPUT_METHODS.CONTROLLER:
	                sprite = spr_controller_icon;
	            break;
	    }
	    
		draw_sprite_ext(sprite, 0, x + (i * 74 + 16), y,1,1,0,c_white,1);
		draw_text_color(x + (i * 74 + 16) + 32,y + 67 ,$"P{i + 1}",c_white,c_white,c_white,c_white,1);

	}
}

if (array_length(global.input_map) <= 4) // todo make this more visible / better text
{
	// draw_text_transformed_color(x + (clamp((array_length(global.input_map) + 1),1.6,1.6)* 74 + 16) + 32,y,"Press the SPACEBAR or the A button to join",0.9,0.9,0,c_white,c_white,c_white,c_white,1);
	draw_text_transformed_color(x + (clamp((array_length(global.input_map) + 1),1.6,1.6)* 74 + 16) + 32,y,"Press [SPACE] button or the [A] button to join",0.9,0.9,0,c_white,c_white,c_white,c_white,1);
}
