if (live_call()) return live_result;

draw_self();

bg_color = #0c7a7a;

draw_rectangle_color(x - sprite_width + 20, y + sprite_height / 2  - 20 , x - sprite_width + 100, y - sprite_height / 2 + 10, bg_color, bg_color, bg_color, bg_color, false);

draw_sprite(spr_ranks, rank, x - sprite_width + 60, y - 5);

draw_set_halign(fa_left);
draw_set_valign(fa_middle);

if (display_time <= 0)
{
    curr_index = clamp(curr_index++,0,array_length(achievment_names) -1);
    display_time = def_display_time;
    show_debug_message("changed text");
}display_time--;

var cur_achievement = achievment_names[1]; // i am not switching throght the list D: fix that pls

// show_debug_message(cur_achivement);

draw_text_transformed_color(x - sprite_width + 115, y - sprite_height / 2 + 30, cur_achievement[0], 2,2,0,c_black, c_black, c_black, c_black,1);
draw_text_ext_transformed_color(x - sprite_width + 115, y + 10, cur_achievement[1],15,sprite_width * 2/3, 1.25,1.25,0,c_black, c_black, c_black, c_black,1);
