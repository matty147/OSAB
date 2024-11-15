draw_set_color(c_white);
draw_set_halign(fa_center);

var object_width = 519;
var object_height = 200;
var margin_x = 30;
var line_y = y + 120;
var text_y = y + 70;

draw_line(x + margin_x, line_y, x + object_width - margin_x, line_y);

// Text
draw_set_font(fnt_large);

var instance = instance_find(manager, 0);

if (instance.menu_id == 0) {
    draw_text(x + object_width / 2, text_y, "Welcome");
} else if (instance.menu_id == 2) {
    draw_text(x + object_width / 2, text_y, "Options");
} else if (instance.menu_id == 1){
	draw_text(x + object_width / 2, text_y, "Level Details");
}