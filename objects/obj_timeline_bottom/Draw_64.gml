draw_set_color(c_white);
draw_set_halign(fa_left);
if !hide
{
	draw_text(10,room_height - numb_of_timelines * timeline_time.sprite_height * 2 - 50,"mouse_x: " + string(mouse_x) + " mouse_y: " + string(mouse_y) + " rotation: " + string(rotation));
}else draw_text(10,room_height - 15,"mouse_x: " + string(mouse_x) + " mouse_y: " + string(mouse_y) + " rotation: " + string(rotation));

if show_checkerboard
{
	draw_set_halign(fa_center);
	draw_text(point_1[0],point_1[1] + 20,"P1 [" + string(point_1[0]) + "," + string(point_1[1]) + "]");
	draw_text(point_2[0],point_2[1] + 20,"P2 [" + string(point_2[0]) + "," + string(point_2[1]) + "]");
}