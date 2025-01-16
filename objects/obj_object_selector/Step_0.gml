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

if mouse_check_button_released(mb_left) && grabbing {
	grabbing = false;
		var instance = instance_create_layer(x,y,"objects", asset_get_index(obj_name));
		show_debug_message("a");
		if string(obj_name) == "obj_test"
		{
			if place_meeting(instance.x, instance.y,obj_timeline_top)
			{
				instance.spawn_time = floor((5*(mouse_x - time_line.x - 30 - offset) + (time_line.time * time_line.distance)/2) / time_line.distance);
				instance.paused = false;
				instance.y = (round((mouse_y - 32) / 64) * 64) + 32;
				instance.display_image = "spr_enemy";//sprite_name;
			}else instance_destroy(instance);
		}
} 
