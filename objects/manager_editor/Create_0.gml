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

if (os_type != 0 )
{
	show_message("This editor sadly only works on windows, you can still create the levels on other platforst but you sadly cannot save nor load them :/");
}