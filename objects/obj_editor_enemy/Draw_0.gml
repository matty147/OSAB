if (instance_exists(timeline))
{
    gpu_set_scissor(timeline.x, timeline.y, timeline.sprite_width, timeline.sprite_height);
    
    draw_self();
    
    if (selected)
	{
		draw_circle_color(x,y,2,c_aqua,c_aqua,false);	
	}
    
    gpu_set_scissor(0, 0, display_get_width(), display_get_height());
}      
