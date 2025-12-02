
image_xscale = (16 + array_length(input_map) * 74) / sprite_get_width(sprite_index);

// if (keyboard_check_pressed(ord("P")))
// {
//     input_map = [];
//     wait = 2;
// }

// if (array_length(input_map) < input_map_max && wait < 0)
// {
//     if (keyboard_check_pressed(vk_anykey))
//     {
//         show_debug_message(keyboard_key);
//         short_key = keyboard_key;
//         input_map = [];
        
//     }
// }

// wait--;

// if (keyboard_check_pressed(short_key))
// {
//     show_debug_message("this shit works");
// }


if (array_length(gamepads) > 0)
{
    var _h = gamepad_axis_value(gamepads[0], gp_axislh);
    var _v = gamepad_axis_value(gamepads[0], gp_axislv);
    x += _h * 4;
    y += _v * 4;

    for (var c = 0; c < array_length(gamepads);c++)
    {
        if ( gamepad_button_check_pressed(gamepads[c],gp_face1))
        {
            show_debug_message($"aaa {c} vs {gamepads[c]}");
            
            if (array_length(input_map) < 4 && !array_contains(allready_added_con,c))
            {
                array_push(input_map,INPUT_METHODS.CONTROLLER);
                array_push(allready_added_con,c);
            }
        }
    }
}

// show_debug_message(gamepads);

if (array_length(input_map) < 4)
{
    if (keyboard_check_pressed(vk_space))
    {
        array_push(input_map,INPUT_METHODS.KEYBOARDS); // tf should i do here?
    }
}

// show_debug_message(array_length(gamepads));