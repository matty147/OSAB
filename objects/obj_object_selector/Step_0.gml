 if mouse_check_button_pressed(mb_left) && position_meeting(mouse_x,mouse_y,id){
    
	grabbing = true;
	
}else{
	x = def_pos_x;
	y = def_pos_y;
}

if grabbing{
	x = mouse_x - offset;
	y = mouse_y;
}

var time_line = instance_find(obj_timeline_time,0);

if mouse_check_button_released(mb_left) && grabbing
{
	grabbing = false;

	var instance = instance_create_layer(x,y,"objects", obj_test);
	
	if sprite_name != "delete"
	{
		show_debug_message("a");
			if place_meeting(instance.x, instance.y, obj_timeline_top)
			{
				var x_in_timeline = mouse_x - time_line.x + time_line.offset; 
				instance.spawn_time = floor(x_in_timeline / time_line.second_size) - 2;
				show_debug_message("Object: x=" + string(x_in_timeline) + "; time=" + string(instance.spawn_time));
			
				//instance.spawn_time = floor((5*(mouse_x - time_line.x - 30 - offset) + (time_line.offset * time_line.distance)/2) / time_line.distance);
				instance.paused = false;
				instance.y = (round((mouse_y - 32) / 64) * 64) + 32;
				instance.display_image = "spr_" + string(_manager.level_object_list[object_number][0]);//sprite_name;
				instance.display_object_size = _manager.level_object_list[object_number][1];
			}else instance_destroy(instance);
	}else instance_destroy(instance);
} 
