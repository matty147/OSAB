if (instance_exists(timeline))
{
    gpu_set_scissor(timeline.x, timeline.y, timeline.sprite_width, timeline.sprite_height);
    
    draw_self();
    
    gpu_set_scissor(0, 0, display_get_width(), display_get_height());
}      
