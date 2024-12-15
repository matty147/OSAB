draw_self();
for (var i = 0; i < numb_of_timestamps; i += 1)
{
	draw_line_color(x + distance * i + 30 + offset,
	y + sprite_height,
	x + distance * i + 30 + offset,
	instance.y,c_fuchsia,c_fuchsia);
}