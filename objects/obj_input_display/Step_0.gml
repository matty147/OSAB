if (live_call()) return live_result;

if (array_length(global.input_map) > 0) // this code is used to change the size of the object based on the amount of controllers are conected
{
	var xscale = (32 + clamp(array_length(global.input_map) + 1,4,4) * 74) / sprite_get_width(sprite_index);
}else xscale = (32 + 74 * 4) / sprite_get_width(sprite_index);;

image_xscale += (xscale - image_xscale) * 0.1;

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

if (array_length(global.input_map) < 4)
{
    if (keyboard_check_pressed(vk_space))
    {
        array_push(global.input_map,INPUT_METHODS.KEYBOARDS); // tf should i do here?
    }
}

// if (image_xscale >= 0.01)
// {
// 	visible = true;
// }else visible = false;