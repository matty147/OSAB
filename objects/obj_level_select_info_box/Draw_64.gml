var _x = x - screen_x;
var _y = y - screen_y;

if visible 
{
	draw_set_color(c_white);
	draw_set_valign(fa_middle);
	
	while string_width(string(data.name)) * text_size > sprite_width - 15
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
	
	draw_text_transformed(_x + sprite_width / 2,_y - sprite_height / 2,string(data.name),text_size,text_size,0);
	//draw_text_transformed(x - screen_x + 30,y - screen_y - sprite_height + 40,"diff: " + string(data.diff),1,1,0);
	
	//var stars = data.diff / 2;

	//for (var i = 0; i < star_amount; i++) {
	//    var star_x = _x + i * 20 + 45;
	//    var star_y = _y - sprite_width / 2 * 0.3 - 8

	//    if (stars >= i + 1) {
	//        // Full star
	//        draw_sprite(spr_difficulty_stars, 0, star_x, star_y);
	//    }
	//    else if (stars >= i + 0.5) {
	//        // Half star
	//        draw_sprite(spr_difficulty_stars, 1, star_x, star_y);
	//    }
	//    else {
	//        // Empty star
	//        draw_sprite(spr_difficulty_stars, 2, star_x, star_y);
	//    }
	//}
	
	//var display_time = "-";
	
	//if (data.lenght < 30)
	//{
	//    display_time = "Farm map";
	//}
	//else if (data.lenght < 60)
	//{
	//    display_time = "Short";
	//}
	//else if (data.lenght  < 180)
	//{
	//    display_time = "Medium";
	//}
	//else if (data.lenght  < 360)
	//{
	//    display_time = "Long";
	//}
	//else
	//{
	//    display_time = "Marathon";
	//}
	
	//draw_text_transformed(x - screen_x + 100,y - screen_y - sprite_height + 40,string(display_time),1,1,0)
}