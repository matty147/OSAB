if (live_call()) return live_result;

draw_self();

bg_color = #0c7a7a;

draw_rectangle_color(x - sprite_width + 20, y + sprite_height / 2  - 20 , x - sprite_width + 100, y - sprite_height / 2 + 10, bg_color, bg_color, bg_color, bg_color, false);

draw_sprite(spr_ranks, rank, x - sprite_width + 60, y - 5);

draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_text_transformed_color(x - sprite_width + 130, y - 5, "This player is an idiot.", 2,2,0,c_black, c_black, c_black, c_black,1);