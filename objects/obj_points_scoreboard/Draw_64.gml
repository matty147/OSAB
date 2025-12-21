if (live_call()) return live_result;

gpu_set_scissor(x - sprite_width, y - sprite_height/ 2, x + sprite_width * 0.5, y + sprite_height * 0.5);

    draw_self();

    bg_color = #0c7a7a;
    
    draw_rectangle_color(x - sprite_width + 20, y + sprite_height / 2  - 20 , x - sprite_width + 100, y - sprite_height / 2 + 10, bg_color, bg_color, bg_color, bg_color, false);
    
    draw_sprite(spr_ranks, rank, x - sprite_width + 60, y - 5);
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    
    if (display_time <= 0)
    {
        _x = x + sprite_width;
        curr_index = clamp(curr_index + 1,0,array_length(achievment_names));
        display_time = def_display_time;
        show_debug_message($"changed text {curr_index}");
    }display_time--;
    
    _x += (x - _x) * 0.1;
    
    if (curr_index < array_length(achievment_names))
    {
        var cur_achievement = achievment_names[curr_index][0]; // i am not switching throght the list D: fix that pls
        
        // show_debug_message(cur_achivement);
        
        draw_text_transformed_color(_x - sprite_width + 115, y - sprite_height / 2 + 30, cur_achievement[0], 2,2,0,c_black, c_black, c_black, c_black,1);
        draw_text_ext_transformed_color(_x - sprite_width + 115, y + 10, cur_achievement[1],15,sprite_width * 2/3, 1.25,1.25,0,c_black, c_black, c_black, c_black,1);
    }
gpu_set_scissor(0, 0, display_get_width(), display_get_height());

draw_sprite_ext(player_sprite,0,x - sprite_width - 64,y - 8,2,2,0,c_white,1);
