if (display_text)
{
	var handle_x = x + (sprite_width - 40) * (global.volume) + 20;
	draw_self();
	draw_line_width_color(x + 10,y,handle_x,y,10,c_grey,c_grey);
	draw_sprite_ext(spr_slider_hold,0,handle_x,y,0.5,0.5,0,c_white,1);
}
