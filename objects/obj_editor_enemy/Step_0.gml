//if (live_call()) return live_result;

var left_edge  = (mouse_x >= x) && (mouse_x <= x + edge_size);
var right_edge = (mouse_x >= x + sprite_width - edge_size) && (mouse_x <= x + sprite_width);

var grid_size = 0.5;

if (mouse_check_button_pressed(mb_left) && instance_position(mouse_x,mouse_y,id))
{
    dragging = true;
    dragged_right_side = right_edge;
    middle = !left_edge && !right_edge; 

    distance_to_x = mouse_x - x;
}

if (dragging)
{
	if (middle)
	{
	    var snapped_x = round((mouse_x - distance_to_x - timeline.x) / timeline.line_amount_w);
	    position = snapped_x;
	    x = clamp(timeline.x + snapped_x * timeline.line_amount_w, timeline.x, room_width);
		
		
		if timeline.y - mouse_y < 0
		{
			var lane_numb = floor(clamp(abs(timeline.y - mouse_y) / sprite_height,0,3));

			y = timeline.y + sprite_height / 2 + sprite_height * lane_numb;
		}
	}else
	{
	    if (dragged_right_side)
	    {
	        var timeline_pos = floor((mouse_x - timeline.x - abs(timeline.x - x)) / timeline.line_amount_w) * timeline.line_amount_w;
	        block_lenght = timeline_pos / timeline.line_amount_w;
	        image_xscale = timeline_pos / 64;
	        image_xscale = clamp(image_xscale,min_lenght_value,max_lenght_value);
	    }else
		{	
			var new_left = clamp(mouse_x, timeline.x, (x + sprite_width) - (min_lenght_value * 64));
    
			var right_edge_x = x + sprite_width;
    
			var new_width = right_edge_x - new_left;
			block_lenght = round(new_width / timeline.line_amount_w);
			
			image_xscale = clamp(block_lenght * timeline.line_amount_w / 64, min_lenght_value, max_lenght_value);
    
			x = right_edge_x - sprite_width;

			position = round((x - timeline.x) / timeline.line_amount_w);
		}
	}
     
    if (mouse_check_button_released(mb_left))
    {
        dragging = false;
    }
}else
{
    image_xscale = block_lenght * timeline.line_amount_w / 64;
    image_xscale = clamp(image_xscale,min_lenght_value,max_lenght_value);

	x = clamp(timeline.x + position * timeline.line_amount_w, timeline.x, room_width);
}

