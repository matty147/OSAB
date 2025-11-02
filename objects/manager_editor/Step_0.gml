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