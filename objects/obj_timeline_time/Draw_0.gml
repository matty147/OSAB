draw_self();
for (var i = 0; i < numb_of_timestamps - 1; i += 1)
{
	
	var _x = x + distance * i + 30 + offset;

	while _x > room_width
	{
		_x -= sprite_width;
	}
	
	while _x < x
	{
		_x += sprite_width;
	}
	
	draw_line_color(_x,
	y + sprite_height,
	_x,
	instance.y,c_fuchsia,c_fuchsia);
}