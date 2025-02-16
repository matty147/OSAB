if keyboard_check_pressed(ord("S")) && keyboard_check(vk_control) && _manager.shortcuts_on
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
