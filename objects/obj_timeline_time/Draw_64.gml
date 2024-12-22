draw_set_halign(fa_center);
draw_set_color(c_white);



offset += (mouse_wheel_up() - mouse_wheel_down()) * distance;
if (offset < 0) offset = 0;
//show_debug_message("offset:" + string(offset))


var start_time = ceil(offset / distance);
//show_debug_message("start:" + string(start_time))

for (var i = 0; i < numb_of_timestamps; i += 1)
{	
	var _x = x + distance * i + 30; 
	var _time = (start_time + i) * 5;

    var minutes = floor(_time / 60); // :) fml
    var seconds = abs(_time % 60);
    seconds = (seconds < 10) ? "0" + string(seconds) : string(seconds); // ensure two digits
    draw_text_transformed(_x, y + sprite_height / 2, string(minutes) + ":" + seconds, 1, 1, 0);

}

time += (mouse_wheel_up() - mouse_wheel_down()) * 10;

if time < 0
{
	time = 0;	
}


// displays object hitbox
//draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1); 

