if (live_call()) return live_result;

draw_self();

draw_sprite_ext(spr_editor_meno_dropdown_img,icon_id,x + 32,y + 32,0.75,0.75,1,c_white,1);

draw_set_valign(fa_middle);
draw_set_halign(fa_left);
draw_set_color(c_white);

draw_text_ext_transformed(round(x + 75), round(y + 10),display_text,1,1000,2,2,0);