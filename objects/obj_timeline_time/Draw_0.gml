draw_self();
for (var i = 0; i < numb_of_timestamps - 1; i += 1)
{
	
	var _x = x + distance * i + 30;
	
	draw_line_color(_x,
	y + sprite_height,
	_x,
	instance.y,c_fuchsia,c_fuchsia);
}