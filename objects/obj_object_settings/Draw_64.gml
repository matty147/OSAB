if (live_call()) return live_result;

if editor_object != noone
{
	var object_name = string_replace_all(string(_manager.level_object_list[0][0]),"_"," ");
	draw_text(x + sprite_width / 2, y + string_height(object_name), object_name);
	
	draw_text(x,y,$"instance x:{editor_object.x}, y:{editor_object.y}");
}