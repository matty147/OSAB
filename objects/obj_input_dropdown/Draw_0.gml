// if (live_call()) return live_result;

draw_self();

draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_text_transformed_color(x + 5,y + sprite_height / 2,$"{inp_dropdown_text}",1.5,1.5,0,c_white,c_white,c_white,c_white,1);
draw_text_transformed_color(x + sprite_width - 25,y + sprite_height / 2,"V",1.5,1.5,0,c_white,c_white,c_white,c_white,1);
