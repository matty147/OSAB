// these do not need to be global
editor_meta = ds_map_create();

randomise();

ds_map_add(editor_meta,"id",irandom_range(0,999999999));
ds_map_add(editor_meta,"name","Default_name");
ds_map_add(editor_meta,"desc","Default");
ds_map_add(editor_meta,"leng",0);
ds_map_add(editor_meta,"diff",0);

save_level = false;
load_level = false;

set_data = [];

editor_enemy_instance_table = [];

// tell the user that the editor is only usable in windows. this only apears when not on windows
if (os_type != 0 )
{
	var msg = show_question("This editor currently only works on Windows. You can still create levels on other platforms, but saving and loading are not supported. \n Do you want to proceed?");

	if (!msg)
	{
		room_goto(main_menu);
	}
	
}

if (!variable_global_exists("editor_music")) {
	global.editor_music = "-1";
}