if (live_call()) return live_result;

function strip_special(_str, only_numbs) { // problem is that it dosent check for invalid chars like ⁿ⌡↕... or other alphabets (japanes chinese...)
    var bad = "@!#$%^&*(){}[];:'\"<>,?/\\|`~+="; // add what you don’t want
	var bad_chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";
    var out = _str;

	if true // use custom chars check or use gml bad default check
	{
	    for (var i = 1; i <= string_length(bad); i++) {
	        var ch = string_char_at(bad, i);
	        out = string_replace_all(out, ch, "");
	    }
	
		if only_numbs
		{	
		    for (var i = 1; i <= string_length(bad_chars); i++) {
				var ch = string_char_at(bad_chars, i);
				out = string_replace_all(out, ch, "");
			}	
		}
	}else
	{
		if only_numbers
		{
			out = string_digits(out) // could theoreticly use but it removes the . which is not a good thing
		}else
		{
			out = string_lettersdigits(out);
		}
	}
	
    return out;
}

if(mouse_check_button_pressed(mb_left)) {
	if position_meeting(mouse_x,mouse_y,id)
	{
		typing = true;
		keyboard_string = text;
		show_typing = true;
		count = 0;
	}else
	{
		if typing
		{	
			save_text = true;
		}
		typing = false;
	}
}

if(typing)
{
	text = keyboard_string;

	text = strip_special(text,only_numbers);

	if (string_length(text) > max_text_lenght)
	{
	   text = string_copy(text, 1, max_text_lenght);
	}

	keyboard_string = text;

	t_ = text;

 // here
 
	if (count > 50 && typing)
	{
		show_typing = !show_typing;
		count = 0;
	}else count++;
}

if(t_ == "") && !typing
{
	t_ = default_var;
}

draw_set_color(c_white);
draw_set_halign(fa_left);

draw_text(x + 10, y, $"{t_}{show_typing && typing ? "_" : ""}");

if t_ != "" && !typing
{
	default_var = t_;
}


if (!typing && save_text) // set back to origin
{
	save_text = false;
	if instance_exists(_parent)
	{
		show_debug_message($"updated data: {t_}");
		//_parent = t_;
		if t_ != ""
		{
			_parent.set_data = [return_key,t_];
		}
	}
}
