if keyboard_check_pressed(ord("S")) && keyboard_check(vk_control)
{
	show_debug_message("saving level");
	
	global.pause = true;
	// Get the ID of a layer
	var layer_id = layer_get_id("spawned"); // fetch all objects in layer

	// Retrieve all elements in the layer
	var elements = layer_get_all_elements(layer_id);

	//for (var i = 0; i < array_length(elements); i++) {
	//    var element_id = elements[i];

	//    var inst_id = layer_instance_get_instance(element_id);

	//    if (instance_exists(inst_id)) {

	//        show_debug_message("Found instance: " + string(inst_id));
	//		show_debug_message("E" + string(inst_id.x) + string(inst_id.y))
	//    }
	//}

	scr_save_level("test.osab", elements, description); // load data into file
	global.pause = false;
}
