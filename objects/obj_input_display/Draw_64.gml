if (live_call()) return live_result;

// ghosts
for (var i = 0; i < 4;i++)
{
	if (i == array_length(global.input_map))
	{
		if (array_length(global.gamepads) > 0) // tf you mean [4]?????? // skill isue ngl // <- bro's talking to himself :wheeze:
		{
	    	sprite = (floor((global.runtime) / 20) % 2 == 0) ? spr_controller_icon : spr_keyboard_icon;
		}else sprite = spr_keyboard_icon;
		
		draw_sprite_ext(sprite, 0, x + (i * 74 + 16), y,1,1,0,c_white,0.5);
		draw_text_color(x + (i * 74 + 16) + 32,y + 67 ,$"P{i + 1}",c_white,c_white,c_white,c_white,1);
	}
}

show_debug_message(global.gamepads);

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
