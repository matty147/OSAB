if keyboard_check(vk_control) && keyboard_check_released(ord("S")) || save_level
{
	var save_objects = [];
	var instances = instance_number(obj_editor_enemy)
	
	for (var count = 0; count < instances; count++)
	{
		array_push(save_objects,instance_find(obj_editor_enemy,count));
	}
	
	scr_save_level(editor_meta,save_objects);
	
	show_debug_message("level saved!")
	
	save_objects = [];
	save_level = 0;

}

if keyboard_check(vk_control) && keyboard_check_released(ord("O"))
{
	
	with (obj_editor_enemy_obj) {instance_destroy();} // cant do this in the same step as creating object or it goes all fucky wucky D:
	
	var level_data = scr_load_level();
	
	var meta = level_data.meta;
	var objects = level_data.level;
	
	show_debug_message("object count: " + string(array_length(objects)));
	
	var sett = instance_find(obj_timeline,0);
	
	repeat (array_length(objects))
	{
		
		var ede = instance_create_layer(sett.y,sett.y,"containers",obj_editor_enemy);
		// with (ede)
		// {
		// // ede.
			
		
		// }
		
	}

}