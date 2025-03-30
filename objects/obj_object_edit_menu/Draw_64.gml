draw_set_color(c_white);
draw_set_valign(fa_middle);

draw_set_halign(fa_center);
draw_text_transformed(x + sprite_width / 2,y + 10 + x_pos.sprite_height / 2,string(object_name),1.5,1.5,0);

draw_set_halign(fa_left);

var text_x = x + 10;
draw_text_transformed(text_x,y + 60 + x_pos.sprite_height / 2,"X pos: ",2,2,0);
draw_text_transformed(text_x,y + 110 + x_pos.sprite_height / 2,"Y pos: ",2,2,0);
draw_text_transformed(text_x,y + 160 + x_pos.sprite_height / 2,"Angle: ",2,2,0);
draw_text_transformed(text_x,y + 210 + x_pos.sprite_height / 2,"Scale: ",2,2,0);
//draw_text_transformed(text_x,y + 210 + x_pos.sprite_height / 2,"X scale: ",2,2,0);
draw_text_transformed(text_x,y + 260 + x_pos.sprite_height / 2,"Speed: ",2,2,0);	
//draw_text_transformed(text_x,y + 260 + x_pos.sprite_height / 2,"Y scale: ",2,2,0);	
draw_text_transformed(text_x,y + 310 + x_pos.sprite_height / 2,"Time: ",2,2,0);
draw_text_transformed(text_x,y + 360 + x_pos.sprite_height / 2,"Advanced: ",2,2,0);


if show_advanced_option
{
	draw_set_color(c_gray);
	draw_line(x + sprite_width / 2, y + 50, x + sprite_width / 2, y + sprite_height - 5);
	draw_set_color(c_white);
}

//draw_set_halign(fa_left)
//draw_text(20, 100,"X: " + string(object_x)
//+ " Y: " + string(object_y)
//+ " angle: " + string(object_rotation)
//+ " scale: " + string(object_x_scale) + ":" + string(object_y_scale)
//+ " Advanced: " + string(show_advanced_option));