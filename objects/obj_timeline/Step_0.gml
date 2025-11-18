if (mouse_wheel_up() || mouse_wheel_down())
{
    timeline_offset += mouse_wheel_down() - mouse_wheel_up();
    
    timeline_offset = clamp(timeline_offset,timeline_offset,0);
    
    // show_debug_message(timeline_offset);
}

if (keyboard_check_pressed(vk_add) || keyboard_check_pressed(vk_subtract))
{
    split_w -= keyboard_check_pressed(vk_add) - keyboard_check_pressed(vk_subtract);
    // split_h = 4;
    
    split_w = clamp(split_w,line_w_min_amount,line_w_max_amount);
    
    line_amount_w = (sprite_width - 1) / split_w;
    // line_amount_h = (sprite_height - 1) / split_h;
}

if (mouse_check_button_pressed(mb_right) &&  instance_position(mouse_x,mouse_y,id))
{
    var ede = instance_create_layer(mouse_x,mouse_y,"objects",obj_editor_enemy);
    
    with (ede)
    {
	    var snapped_x = floor((x - distance_to_x - timeline.x) / timeline.line_amount_w) - timeline.timeline_offset;
	    position = snapped_x;
	    x = clamp(timeline.x + (snapped_x + timeline.timeline_offset) * timeline.line_amount_w, timeline.x, room_width);
	    
		var lane_numb = floor(clamp(abs(timeline.y - y) / sprite_height,0,3));

		y = timeline.y + sprite_height / 2 + sprite_height * lane_numb;
		
		
    }
}

if (keyboard_check_pressed(vk_space))
{
    level_play = !level_play;    
}

if (level_play)
{
    timeline_offset -= 85 / (5 * room_speed);
}

if (keyboard_check_pressed(vk_backspace)) {timeline_offset = 0;}