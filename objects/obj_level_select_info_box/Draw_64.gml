if visible 
{
	draw_set_color(c_white);
	draw_set_valign(fa_middle);
	
	while string_width(string(data.name)) * text_size > sprite_width
	{
	
		repeat_numb++;
	
		if string_width(string(data.name)) * text_size > sprite_width - 50
		{
			if text_size > 0.7
			{
				text_size -= 0.1;
			}
			show_debug_message(string_length(data.name));
			
		}else if text_size < 1 && string_width(string(data.name)) * (text_size + 0.1) < sprite_width - 50
		{
			text_size += 0.1;
		}
		
		if repeat_numb > 10
		{
			break;
		}
	}
	
	
	var minutes = floor(data.lenght / 60); // calculate seconds
    var seconds = abs(data.lenght % 60); // calculate minutes
    seconds = (seconds < 10) ? "0" + string(seconds) : string(seconds);
	
	
	draw_text_transformed(x - screen_x + sprite_width / 2,y - screen_y - sprite_height + 15,string(data.name),text_size,text_size,0);
	draw_text_transformed(x - screen_x + 20,y - screen_y - sprite_height + 40,string(data.diff) + "X",1,1,0); //difrent colors  -> difrent diff
	draw_text_transformed(x - screen_x + 100,y - screen_y - sprite_height + 40,string(minutes) + ":" + string(seconds),1,1,0); //difrent colors  -> difrent diff
}