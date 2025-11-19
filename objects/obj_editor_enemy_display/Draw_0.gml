if (instance_exists(game_window))
{
    gpu_set_scissor(game_window.x, game_window.y, game_window.sprite_width, game_window.sprite_height);
    
    draw_self();
    
    gpu_set_scissor(0, 0, display_get_width(), display_get_height());
}                     