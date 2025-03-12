if keyboard_check_pressed(ord("S")) && keyboard_check(vk_control) && _manager.shortcuts_on // save level
{
	show_debug_message("saving level");
	
	global.pause = true;
	// Get the ID of a layer
	var layer_id = layer_get_id("objects"); // fetch all objects in layer

	// Retrieve all elements in the layer
	var elements = layer_get_all_elements(layer_id);

	array_sort(elements,function(a,b)
		{
			return layer_instance_get_instance(a).spawn_time - layer_instance_get_instance(b).spawn_time;
		}
	)
	
	scr_save_level("test.osab", elements, description); // load data into file
	global.pause = false;
}

if keyboard_check_pressed(ord("O")) && keyboard_check(vk_control) && _manager.shortcuts_on // load level
{
	var level_data = scr_load_level();
	
	show_debug_message("/////////////////////////////////////////");	
	show_debug_message(level_data);
	var layer_id = layer_get_id("objects");
	var delete_objects = layer_get_all_elements(layer_id);
	
	show_debug_message("E");
	
	for (var i = 0; i < array_length(delete_objects); i++)
	{
		show_debug_message("deleting obj: " + string(layer_instance_get_instance(delete_objects[i])));
		instance_destroy(layer_instance_get_instance(delete_objects[i]));
	}
	
	for (var i = 0; i < array_length(level_data[1]); i++) //, time, id, x, y, scale, direction, speed, alpha
	{
		show_debug_message("placed an object: " + string(i));	
		
		var object = level_data[1][i];	
	
		var instance = instance_create_layer(210,736,"objects",obj_test);
		with (instance)
		{// unpacking or save level_data[1][i] into a var so its easier
			spawn_time = real(object[0]);	
			object_x = real(object[2]);
			object_y = real(object[3]);
			object_x_scale = real(object[4]);
			object_y_scale = real(object[4]);
			object_rotation = real(object[5]);
			object_speed = real(object[6]);
			display_image = "spr_test";
			display_object_size = 0.1;
		}		
	}
}

if keyboard_check_pressed(ord("R")) && _manager.shortcuts_on
{
	show_debug_message(time_line.offset);
	time_line.offset = floor(time_line.offset / 17) * 17;
	show_debug_message(time_line.offset);
}
