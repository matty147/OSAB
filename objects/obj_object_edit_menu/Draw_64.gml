draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(x + 30,y + 10 + x_pos.sprite_height / 2,"X: ",2,2,0);
draw_text_transformed(x + 30,y + 60 + x_pos.sprite_height / 2,"Y: ",2,2,0);


draw_set_halign(fa_left)
draw_text(20, 100,"X: " + string(object_x) + " Y: " + string(object_y) + " angle: " + string(object_rotacion))