draw_self();
for (var i = 0; i < numb_of_timestamps; i += 1)
{
	draw_line_color(x + distance * i + 30 + a,
	y + sprite_height,
	x + distance * i + 30 + a,
	instance.y,c_fuchsia,c_fuchsia);
}