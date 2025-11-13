if (array_length(set_data) != 0)
{
	switch (set_data[0])
	{
		case "id":
			editor_meta[? "id"] = set_data[1];
				break;
		case "name":
			editor_meta[? "name"] = set_data[1];
				break;
		case "desc":
			editor_meta[? "desc"] = set_data[1];
				break;
		case "leng":
			editor_meta[? "leng"] = set_data[1];
				break;
		case "diff":
			editor_meta[? "diff"] = set_data[1];
				break;
		default:
			show_debug_message($"wrong key: {set_data[0]}");
				break;
	}

	show_debug_message($"updated {set_data[0]} with {set_data[1]}");

	set_data = [];	
}

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
	
	show_debug_message($"{editor_meta[? "name"]}");
	
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
		ede.object_sprite = inp_obj.object_type;
		
		
// instance.object_sprite = objects[current_index].object_type;
// instance.image_xscale = size[0];
// instance.image_yscale = size[1];
// instance.angle = objects[current_index].angle;
// instance._speed = move.speed;
// instance.image_alpha = move.alpha;
// instance.survive_speed = real(move.duration) * 85;
// instance.move = true; //????
// instance.show_hitbox = real(move.show_hitbox);
 
// instance.move_type = variable_struct_exists(move, "move_type") ? move.move_type : "None";	
// instance.positions = variable_struct_exists(move, "positions") ? move.positions : [];
// instance.bounce = variable_struct_exists(move, "bounce") ? move.bounce: [0,0]; 
// instance._gravity = variable_struct_exists(move, "gravity") ? move.gravity: 0;
// instance.splines = variable_struct_exists(move, "spline") ? move.spline: false;
// instance._friction = variable_struct_exists(move, "friction") ? move.friction: false;
// instance.end_scale = variable_struct_exists(move, "end_scale") ? move.end_scale: [size[0],size[1]];
// instance.scale_speed = variable_struct_exists(move, "end_scale") ? move.scale_speed: [move.speed,move.speed];
		
		inp_move = inp_obj.move;
		
		show_debug_message($"inpmove: {inp_move}");
		
		ede.object_speed =			inp_move.speed;
		ede.object_alpha =			inp_move.alpha;
		ede.object_show_hitbox =	inp_move.duration;
		ede.object_duration =		inp_move.show_hitbox;
		ede.object_move =			true;
		ede.object_move_type =		inp_move.move_type;
		ede.object_spline = 		(undefined != inp_move.spline) ? inp_move.spline : false;
		ede.object_positions =		inp_move.positions;
		ede.object_bounce = 		inp_move.bounce;
		ede.object_gravity =		inp_move.gravity;
		ede.object_friction =		inp_move.friction;
		ede.object_end_scale =		inp_move.end_scale;
		ede.object_scale_speed =	inp_move.scale_speed;
		
		// move
		
		//{ speed : 5, duration : 5, alpha : 0.40, show_hitbox : 25 }
		
		ede.object_move = inp_move.speed;
		ede.object_image_alpha = inp_move.alpha;
		ede.object_survive_speed = inp_move.duration; 
		// ede.obj_move = inp_move.move;
		ede.obj_show_hitbow = inp_move.show_hitbox;
		
		editor_meta[? "id"] = meta.id;
		editor_meta[? "name"] = meta.name;
		editor_meta[? "desc"] = meta.description;
		editor_meta[? "leng"] = meta.lenght;
		editor_meta[? "diff"] = meta.diff;
	}

	load_level = false;

}