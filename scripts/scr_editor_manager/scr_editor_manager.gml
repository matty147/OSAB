/// @description saves data into a file
/// @returns parsed json
function scr_load_level(){

	var file_location = get_open_filename(".osab|*.osab","");

	if (file_exists(file_location))
	{
	
		var json = "";
	
		var file = file_text_open_read(file_location);
	
		while(file_text_eof(file) == false)
		{
			json += file_text_readln(file);
		}
		
		file_text_close(file);
			
		level_data = json_parse(json);
	
		return level_data; // should i parse the data or leave it just as it is?
	
	}

}


/// @description saves data into a file
/// @param meta_data level info that will show on when selecting a level
/// @param level_objects a list of obj_editor_enemy objects

function scr_save_level(meta_data, level_objects){
	show_debug_message($"saveing objects: {level_objects}");
	
	ds_save_data = ds_map_create();
	ds_meta = ds_map_create();
	ds_level = ds_list_create();
	
	empty = ds_map_empty(meta_data);
	
	ds_map_add(ds_meta,"id", empty ? "0" : meta_data[? "id"]);
	ds_map_add(ds_meta,"name", empty ? "Default name": meta_data[? "name"]);
	ds_map_add(ds_meta,"description", empty ? "Default description" : meta_data[? "desc"]);
	ds_map_add(ds_meta,"lenght", empty ? 0 :  meta_data[? "leng"]); // i am a idiot and cannot change this D: (lenght/length)
	ds_map_add(ds_meta,"diff", empty ? 0 : meta_data[? "diff"]);

    for (var i = 0; i < array_length(level_objects); i++) {
        var obj = level_objects[i];
        var ds_object_data = ds_map_create();
        var ds_move = ds_map_create();
    
        ds_map_add(ds_object_data, "time", ceil(obj.object_time));
        ds_map_add(ds_object_data, "object_type", obj.sprite);
        ds_map_add(ds_object_data, "position", obj.object_position);
        ds_map_add(ds_object_data, "size", obj.object_size);
        ds_map_add(ds_object_data, "angle", obj.object_angle);
		
		ds_map_add(ds_move,"speed",obj.object_speed);
		ds_map_add(ds_move,"alpha",obj.object_image_alpha);
		ds_map_add(ds_move,"duration",obj.object_survive_speed);
		ds_map_add(ds_move,"move",obj.object_move);
		ds_map_add(ds_move,"show_hitbox",obj.object_show_hitbow);
		ds_map_add(ds_move,"move_type",obj.object_move_type);
		ds_map_add(ds_move,"spline",obj.object_spline);
		ds_map_add(ds_move,"positions",obj.object_positions);
		ds_map_add(ds_move,"bounce",obj.object_bounce);
		ds_map_add(ds_move,"gravity",obj.object_gravity);
		ds_map_add(ds_move,"friction",obj.object_friction);
		ds_map_add(ds_move,"end_scale",obj.object_end_scale);
		ds_map_add(ds_move,"scale_speed",obj.object_scale_speed);
		
		ds_map_add_map(ds_object_data,"move",ds_move);
    
        ds_list_add_map(ds_level, ds_object_data);
    }
	
	show_debug_message("-----------------");
	show_debug_message(ds_meta);
	show_debug_message("-----------------");
	show_debug_message(ds_level);
	show_debug_message("-----------------");
	
	
	ds_map_add_map(ds_save_data,"meta",ds_meta);
	ds_map_add_list(ds_save_data,"level",ds_level);
	
	// show_debug_message(ds_save_data);
	
	json = json_encode(ds_save_data,false);
	
	var file_location = get_save_filename(".osab|*.osab","");
	
	var file = file_text_open_write(file_location);
	
	file_text_write_string(file, (json));
	file_text_close(file);
	
	show_debug_message("finished saving data");
	show_debug_message("-----------------");
	show_debug_message(json);
	show_debug_message("-----------------");


    ds_list_destroy(ds_level);
    
    ds_map_destroy(ds_meta);
}




// why the fuck do these not exist in normal gml????

function ds_list_add_map(parent, map)
{
    var pos = ds_list_size(parent);
    ds_list_add(parent, map);
    ds_list_mark_as_map(parent, pos);
}

function ds_list_add_list(parent, list)
{
    var pos = ds_list_size(parent);
    ds_list_add(parent, list);
    ds_list_mark_as_list(parent, pos);
}