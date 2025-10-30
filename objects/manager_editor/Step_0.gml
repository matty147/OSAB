if keyboard_check(vk_control) && keyboard_check_released(ord("S"))
{
	var save_objects = [];
	var instances = instance_number(obj_editor_enemy)
	
	for (var count = 0; count < instances; count++)
	{
		array_push(save_objects,instance_find(obj_editor_enemy,count));
	}
	
	var meta = ds_map_create();
	ds_map_add(meta,"_id","1");
	ds_map_add(meta,"name","Default name");
	ds_map_add(meta,"description", "Default description");
	ds_map_add(meta,"lenght",0); // i am a idiot and cannot change this D: (lenght/length)
	ds_map_add(meta,"diff", 0);
	
	scr_save_level(meta,save_objects);
	
	ds_map_destroy(meta);
	save_objects = [];
}