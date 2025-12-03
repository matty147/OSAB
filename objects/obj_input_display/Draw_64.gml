for (var i = 0; i < array_length(global.input_map);i++)
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
    
    draw_sprite(sprite, 0, x + (i * 64 + 16), y);
}
