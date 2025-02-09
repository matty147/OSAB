draw_set_halign(fa_center);
draw_set_color(c_white);

// move timeline manually
offset += (mouse_wheel_up() - mouse_wheel_down()) * distance;
if (offset < 0) offset = 0;

//offset = curent time
// distance = 85 (distance from one timestamp to another)
var start_time = floor(offset / distance); // calculates the current time (have to multiply it to get seconds)

//create timestamps
for (var i = 0; i < numb_of_timestamps; i++)
{	
	var _x = x + distance * i + 30; //calculates the timestamps position
	var _time = (start_time + i) * 5; // calculates time for the timestamp

    var minutes = floor(_time / 60); // calculate seconds
    var seconds = abs(_time % 60); // calculate minutes
    seconds = (seconds < 10) ? "0" + string(seconds) : string(seconds); // ensures two digits
	if !position_meeting(_x,y + sprite_height / 2, obj_object_edit_menu)
	{
		draw_text_transformed(_x, y + sprite_height / 2, string(minutes) + ":" + seconds, 1, 1, 0);
	}
}

// displays object hitbox
//draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1); 