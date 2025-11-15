if (live_call()) return live_result;

if (display_object)
{
	if (obj_display_object == noone)
	{
		obj_display_object = instance_create_layer(object_position[0],object_position[1],"objects",obj_editor_enemy_display);
		show_debug_message("created");
	}
	
		// make this update only when there is new data
		// check if the data given is valid!!!!
		obj_display_object.sprite_index = asset_get_index($"spr_{sprite}");
		obj_display_object.x = game_window.x + object_position[0] / (room_width / game_window.sprite_width);
		obj_display_object.y = game_window.y + object_position[1] / (room_height / game_window.sprite_height);
		obj_display_object.image_xscale = real(object_size[0]) * real(level_object_map[? sprite]);
		obj_display_object.image_yscale = real(object_size[1]) * real(level_object_map[? sprite]);
		obj_display_object.image_angle = object_angle;
	
}

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
	if (middle) // moving
	{
	    var snapped_x = round((mouse_x - distance_to_x - timeline.x) / timeline.line_amount_w) - timeline.timeline_offset;
	    position = snapped_x;
	    // x = clamp(timeline.x + (snapped_x + timeline.timeline_offset) * timeline.line_amount_w,timeline.x, room_width);
	    x = clamp(timeline.x + (snapped_x + timeline.timeline_offset) * timeline.line_amount_w,0, room_width);

		
		
		if (timeline.y - mouse_y < 0)
		{
			var lane_numb = floor(clamp(abs(timeline.y - mouse_y) / sprite_height,0,3));

			y = timeline.y + sprite_height / 2 + sprite_height * lane_numb;
		}
	}else // scaling
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

			position = round((x - timeline.x) / timeline.line_amount_w) - timeline.timeline_offset;
		}
	}
     
    if (mouse_check_button_released(mb_left)) 
    {
		//object_time = x + sprite_width + timeline.sprite_widths / timeline.tick;
        dragging = false;
    }
}else
{
    image_xscale = block_lenght * timeline.line_amount_w / 64;
    image_xscale = clamp(image_xscale,min_lenght_value,max_lenght_value);

	// x = clamp(timeline.x + (position + timeline.timeline_offset) * timeline.line_amount_w, timeline.x, room_width);
	x = clamp(timeline.x + (position + timeline.timeline_offset) * timeline.line_amount_w, -room_width, room_width);
}

object_time = round((x - timeline.x) / timeline.line_amount_w) - timeline.timeline_offset;

if (editor_object_time >= 0)
{
	x = editor_x;
	object_time = editor_object_time;
	position = round((x - timeline.x) / timeline.line_amount_w) - timeline.timeline_offset;
	editor_object_time = -1;
}