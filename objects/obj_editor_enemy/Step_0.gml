
var left_edge  = (mouse_x >= x) && (mouse_x <= x + edge_size);
var right_edge = (mouse_x >= x + sprite_width - edge_size) && (mouse_x <= x + sprite_width);

if (left_edge || right_edge)
{
    
    if (mouse_check_button_pressed(mb_left))
    {
         dragging = true;
         dragged_right_side = right_edge;
    }
}

if (dragging)
{
    if (dragged_right_side)
    {
        var timeline_pos = floor((mouse_x - timeline.x) / timeline.line_amount_w) * timeline.line_amount_w;
        block_lenght = timeline_pos / timeline.line_amount_w;
        show_debug_message(timeline_pos);
        image_xscale = timeline_pos / 64;
        image_xscale = clamp(image_xscale,min_lenght_value,max_lenght_value);
    }
    
    show_debug_message($"scale: {image_xscale}");
    
    if (mouse_check_button_released(mb_left))
    {
        dragging = false;
    }
}else
{
    // check if any updates where made to the size of the grid
    image_xscale = block_lenght * timeline.line_amount_w / 64;
    image_xscale = clamp(image_xscale,min_lenght_value,max_lenght_value);
}