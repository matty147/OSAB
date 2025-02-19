function ais_numeric(string) {
    for (var i = 1; i <= string_length(string); i++) {
        var char = string_char_at(string, i);
        if (!((char >= "0") && (char <= "9")  || (char == ".") || (char = "-"))) {
            return false;
        }
    }
    return true;
}

if setup
{
	show_debug_message("a: " + string(last_valid_input));
	last_valid_input = "0";
	
	setup = false;
}


if mouse_check_button_pressed(mb_left) && position_meeting(mouse_x,mouse_y,id)
{
	_manager.selected_items++;
	selected = true;
	timer = fps;
	keyboard_string = "";
}if !position_meeting(mouse_x,mouse_y,id) && mouse_check_button_pressed(mb_left) && selected || keyboard_check_pressed(vk_escape) && selected
{
	_manager.selected_items--;

	selected = false;


	if !ais_numeric(text) && numeric_check
	{
		text = last_valid_input;		
	}
	
	if string_length(string(text)) > max_text_lenght
	{
		text = string_copy(text, 1, max_text_lenght);
	}
	
	last_valid_input = text;
	
}

if selected
{	
	if keyboard_check(vk_anykey) && string_length(text) < max_text_lenght
	{
		text = string(text) + string(keyboard_string);
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
}

delete_time++;
