image_speed = 0;

if boss_level
{
	image_index = 1;	
}else image_index = 0;

checkpoint_manager = instance_find(obj_checkpoint_manager,0);

cleared = false;

if checkpoint_id <= global.cleared_levels
{
	show_debug_message(global.cleared_levels);
	
	visible = true;
	
	if checkpoint_id < global.cleared_levels
	{
		cleared = true;	
	}
}
locked = false;

if visible == false
{
	visible = true;
	locked = true;
	
}

var level_data = undefined;	

var json = "";
		
var file_name = file_text_open_read(level_name);
	
while(file_text_eof(file_name) == false)
{
	var line = file_text_readln(file_name);
	if string_trim(line) == "},"
	{
		json += "}\n";
		json += "}";
		break;
	}else json += line;
}
		
file_text_close(file_name);

show_debug_message("leveldata:  " + string(json));
		
level_data = json_parse(json);
	
meta = "";

if level_data != undefined
{			
				
	meta = level_data.meta;
				
	if string_length(string(meta.description)) > 80
	{
		meta.description = string_copy(string(meta.description), 1, 80) + "...";
	}
}

show_debug_message(meta);

display_info_box = false;

info_box = instance_create_layer(x - sprite_width / 2 * 4,y - sprite_height/2,"checkpoints",obj_level_select_info_box);
info_box.visible = false;
info_box.data = meta;
info_box.cleared = false;
