draw_set_halign(fa_center);
draw_set_color(c_white);
for (var i = 0; i < numb_of_timestamps; i += 1)
{
	var minutes = floor((time + 5*i)/60);
	var seconds = (time + 5*i)%60;
	seconds= (seconds < 10) ? "0" + string(seconds) : string(seconds); // ensure there will always be two digits
	draw_text_transformed(x + distance * i + 30,y + sprite_height/2,string(minutes) + ":" + seconds,1,1,0);
	
	draw_line_color(x + distance * i + 30,
	y + sprite_height,
	x + distance * i + 30,
	instance.y,c_fuchsia,c_fuchsia);
}