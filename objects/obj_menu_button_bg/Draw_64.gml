
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_line(x+30, y+120, x+470, y+120);

var instance = instance_find(manager,0);

if (instance.menu_id == 0) {
	draw_set_halign(fa_center);
	draw_text(x+250, y+80, "Welcome");
} else if (instance.menu_id == 1) {
	draw_set_halign(fa_center);
	draw_text(x+250, y+80, "Options");
}
	