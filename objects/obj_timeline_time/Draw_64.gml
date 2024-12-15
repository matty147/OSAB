draw_set_halign(fa_center);
draw_set_color(c_white);

for (var i = 0; i < numb_of_timestamps - 1; i += 1)
{
	var _x = x + distance * i + 30 + offset;
	
	if  _x < room_width - sprite_width
	{
		
	}else if _x > room_width
	{
		show_debug_message(time_stamps);

		var last_value = time_stamps[array_length(time_stamps) -1];

		array_insert(time_stamps, 0, last_value);

		array_delete(time_stamps, array_length(time_stamps) -1, 1)

		show_debug_message(time_stamps);
	}

        var minutes = floor((time_stamps[i] + 5 * i) / 60); // :) fml
        var seconds = abs((time_stamps[i] + 5 * i) % 60);
        seconds = (seconds < 10) ? "0" + string(seconds) : string(seconds); // ensure two digits
        draw_text_transformed(_x, y + sprite_height / 2, string(minutes) + ":" + seconds, 1, 1, 0);

}

// put data into a list and fecht the data from the list

time += (mouse_wheel_up() - mouse_wheel_down()) * 5;

if time < 0 
{
	time = 0;	
	scroll = 10;
}scroll--;


if scroll <= 0
{
	offset += (mouse_wheel_up() - mouse_wheel_down()) * 2;
}

// displays object hitbox
//draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1); 

