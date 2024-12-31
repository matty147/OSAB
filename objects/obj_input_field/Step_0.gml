function ais_numeric(string) {
    for (var i = 1; i <= string_length(string); i++) {
        var char = string_char_at(string, i);
        if (!((char >= "0") && (char <= "9"))) {
            return false;
        }
    }
    return true;
}



if mouse_check_button_pressed(mb_left) && position_meeting(mouse_x,mouse_y,id)
{

	selected = true;
	timer = fps;
	keyboard_string = "";
	
}if !position_meeting(mouse_x,mouse_y,id) && mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_escape)
{
	selected = false;
	show_debug_message(text);
	if !ais_numeric(text)
	{
		text = last_valid_input;
	}else last_valid_input = text;
}

if selected
{
	
	if keyboard_check(vk_anykey) && string_length(text) < max_text_lenght
	{
		text = text + string(keyboard_string);
		keyboard_string = "";
	}

	if keyboard_check(vk_backspace) && !keyboard_check_pressed(vk_backspace) && delete_time = 5
	{
		text = string_delete(text,string_length(text),1);
		delete_time = 0;
		keyboard_string = "";
	}

	if(keyboard_check_pressed(vk_backspace))
	{
		text = string_delete(text,string_length(text),1)	
		delete_time = -4;
		keyboard_string = "";
	}
	_manager.shortcuts_on = false;
}else
{
	_manager.shortcuts_on = true;
}

delete_time++;
