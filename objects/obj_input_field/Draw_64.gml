draw_set_color(c_black);
//draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,true);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
//if instance_position(x,y,obj_level_data_editor) && level_data_editor.hidden || !instance_position(x,y,obj_level_data_editor)
//{

	if string_width(string(text)) * text_size > sprite_width - 10
	{
		if text_size > 0.5
		{
			text_size -= 0.1;
		}
		show_debug_message(string_length(text));
	}else if text_size < 1 && string_width(string(text)) * (text_size + 0.1) < sprite_width - 10
	{
		text_size += 0.1;
	}

	if selected && timer > 0
	{
		draw_text_transformed(x + sprite_width / 2,y + sprite_height / 2,string(text) + "_",text_size,text_size,0);
	}else draw_text_transformed(x + sprite_width / 2,y + sprite_height / 2,string(text) + "  ",text_size,text_size,0);

if timer < -fps
{
	
	timer = fps;
	
}timer--;

//show_debug_message(text);