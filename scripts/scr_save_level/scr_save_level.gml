/// @description saves data into a file
/// @param file_name name of the file + .osab
/// @param data data from the objects to save

function scr_save_level(file_name, data, description){
	
	
	var file_location = get_save_filename(".osab|*.osab","");
	var fileid = file_text_open_write(file_location); // C:\Users\<user>\AppData\Local\<project name> why the fuck is it there T-T
	//var fileid = get_save_filename(".osab|*.osab","");
	//C:\Users\matty\AppData\Local\JS_B_rougelike
	if fileid = -1 // it will go to the same place when exported fuck this
	{
		show_debug_message("saving failed!!!!");
		exit;
	}
	
	file_text_write_string(fileid,"//,");
	file_text_write_string(fileid,"this is a test level");
	
	file_text_writeln(fileid);
	file_text_writeln(fileid);
	file_text_write_string(fileid,"id,");
	file_text_write_real(fileid,description[0]);
	
	file_text_writeln(fileid);
	file_text_write_string(fileid,"name,");
	file_text_write_string(fileid,description[1]);
	
	file_text_writeln(fileid);
	file_text_write_string(fileid,"description,");
	file_text_write_string(fileid,description[2]);
	
	file_text_writeln(fileid);
	file_text_write_string(fileid,"lenght,");
	file_text_write_real(fileid,description[3]);
	
	file_text_writeln(fileid);
	file_text_write_string(fileid,"diff,");
	file_text_write_real(fileid,description[4]);
	
	file_text_writeln(fileid);
	file_text_write_string(fileid,"-");

	file_text_writeln(fileid);
	file_text_writeln(fileid);
	
	for (var i = 0; i < array_length(data); i += 1)
	{
		var inst_id = layer_instance_get_instance(data[i]);
		file_text_write_string(fileid,string(inst_id.spawn_time)
		+ ","+ "0"
		+ "," + string(inst_id.object_x)
		+ "," + string(inst_id.object_y)
		+ "," + string(inst_id.object_x_scale)
		+ "," + string(inst_id.object_rotation)
		+ "," + string(inst_id.object_speed)
		+ "," + "0.75"); // object alpha
		//+ "," + string(inst_id.survive_speed));
		file_text_writeln(fileid);
	}
	file_text_close(fileid);
	show_message("File saved! (" + string(array_length(data)) + ") objects");
}
	
	//for (var i = 0; i < array_length(data); i += 1)
	//{
	//	var inst_id = layer_instance_get_instance(data[i]);
	//	file_text_write_string(fileid,"0"
	//	+ ","+ string(inst_id.image_index)
	//	+ "," + string(inst_id.x)
	//	+ "," + string(inst_id.y)
	//	+ "," + string(inst_id.image_xscale)
	//	+ "," + string(inst_id.angle)
	//	+ "," + string(inst_id._speed)
	//	+ "," + string(inst_id.image_alpha)
	//	+ "," + string(inst_id.survive_speed));
	//	file_text_writeln(fileid);
	//}
	
	//file_text_write_real(fileid,69);
	//file_text_write_string(fileid,"hello");

/*
			//, time, id, x, y, scale, direction, speed, alpha

			instance = instance_create_layer(_x[current_index],_y[current_index],"spawned",obj_enemy);
			instance.image_index = _id[current_index];
			instance.image_xscale = _size[current_index];
			instance.image_yscale = _size[current_index];
			instance.angle = _angle[current_index];
			instance._speed = _speed[current_index];
			instance.image_alpha = _alpha[current_index];
			instance.survive_speed = 500;
			current_index++;	