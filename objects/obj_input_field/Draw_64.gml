draw_set_color(c_black);
//draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,true);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
//if instance_position(x,y,obj_level_data_editor) && level_data_editor.hidden || !instance_position(x,y,obj_level_data_editor)
//{

	if selected && timer > 0
	{
		draw_text(x + sprite_width / 2,y + sprite_height / 2,string(text) + "_");
	}else draw_text(x + sprite_width / 2,y + sprite_height / 2,string(text) + "  ");
//}

if timer < -fps
{
	
	timer = fps;
	
}timer--;

//show_debug_message(text);