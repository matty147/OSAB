
image_xscale = (16 + array_length(global.input_map) * 74) / sprite_get_width(sprite_index);

if (keyboard_check_pressed(ord("P")))
{
    global.input_map = [];
    already_added_con = [];
    already_added_key = [];
}

if (array_length(global.gamepads) > 0)
{
    for (var c = 0; c < array_length(global.gamepads);c++)
    {
        if (gamepad_button_check_pressed(global.gamepads[c],gp_face1))
        {
            show_debug_message($"aaa {c} vs {global.gamepads[c]}");
            
            if (array_length(global.input_map) < 4 && !array_contains(already_added_con,c))
            {
                array_push(global.input_map,[INPUT_METHODS.CONTROLLER,global.gamepads[c]]);
                array_push(already_added_con,c);
            }
        }
    }
}

// show_debug_message(global.gamepads);

if (array_length(global.input_map) < 4)
{
    if (keyboard_check_pressed(vk_space))
    {
        array_push(global.input_map,INPUT_METHODS.KEYBOARDS); // tf should i do here?
    }
}

// show_debug_message(array_length(global.gamepads));