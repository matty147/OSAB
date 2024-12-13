draw_set_halign(fa_center);
draw_set_color(c_white);
for (var i = 0; i < numb_of_timestamps; i += 1)
{
	var minutes = floor((time + 5 *i)/60);
	var seconds = abs((time + 5*i)%60);
	seconds = (seconds < 10) ? "0" + string(seconds) : string(seconds); // ensure there will always be two digits
	draw_text_transformed(x + distance * i + 30 + a,y + sprite_height/2,string(minutes) + ":" + seconds,1,1,0);
}

time += (mouse_wheel_up() - mouse_wheel_down() ) * 5;

if time < 0 
{
	time = 0;	
	scroll = 10;
}scroll--;


if scroll <= 0
{
	a += (mouse_wheel_up() - mouse_wheel_down());
	show_debug_message(a);
}

