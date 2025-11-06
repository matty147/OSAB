if (keyboard_check(vk_control) && keyboard_check_released(ord("S"))) || save_level
{
	var save_objects = [];
	var instances = instance_number(obj_editor_enemy);
	
	for (var count = 0; count < instances; count++)
	{
		array_push(save_objects,instance_find(obj_editor_enemy,count));
	}
	
	array_sort(save_objects,function(a,b) // spawntime does not exists
	{
		show_debug_message("a: " + string(a.object_time));
		show_debug_message("b: " + string(b.object_time));
		return  a.object_time - b.object_time;
	}
	);
	
	show_debug_message(save_objects);
	
	scr_save_level(editor_meta,save_objects);
	
	show_debug_message("level saved!");
	
	save_objects = [];
	save_level = 0;

}

if (keyboard_check(vk_control) && keyboard_check_released(ord("O")) || load_level)
{
	
	var level_data = scr_load_level();
	
	var meta = level_data.meta;
	var objects = level_data.level;
	
	show_debug_message("object count: " + string(array_length(objects)));
	
	with (obj_editor_enemy) {mark_delete = true;} // gml is stupid and i cant mark and create object at the same time for some reason??????
	
	var sett = instance_find(obj_timeline,0);
	
	for (var i = 0; i < array_length(objects);i++)
	{
		var ede = instance_create_layer(sett.x,sett.y,"containers",obj_editor_enemy);
		with (ede)
		{
			image_xscale = 0.75;
			image_yscale = 0.75;
			
		    var snapped_x = round((x - distance_to_x - timeline.x) / timeline.line_amount_w);
		    position = snapped_x;
		    x = clamp(timeline.x + snapped_x * timeline.line_amount_w, timeline.x, room_width);
		    
			var lane_numb = floor(clamp(abs(timeline.y - y) / sprite_height,0,3));
	
			y = timeline.y + sprite_height / 2 + sprite_height * lane_numb;
		}
		
		inp_obj = objects[i];
		inp_move = inp_obj.move;
		
		show_debug_message($"inp: {inp_move}");
		show_debug_message($"inp: {inp_obj}");
		
		ede.object_time = inp_obj.time;
		ede.object_name = inp_obj.object_type;
		ede.object_position = inp_obj.position;
		ede.object_size = inp_obj.size;
		ede.object_angle = inp_obj.angle;
		ede.sprite = inp_obj.object_type;
		
		// move
		
		//{ speed : 5, duration : 5, alpha : 0.40, show_hitbox : 25 }
		
		ede.object_move = inp_move.speed;
		ede.object_image_alpha = inp_move.alpha;
		ede.object_survive_speed = inp_move.duration; 
		// ede.obj_move = inp_move.move;
		ede.obj_show_hitbow = inp_move.show_hitbox;
		
	}

	load_level = false;

}