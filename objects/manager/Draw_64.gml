draw_self();

if room == level
{
	if global.pause //temp
	{
		instance_activate_layer("pause_menu");
		draw_text_transformed(room_width * 3/4,room_height * 1/4,"Paused",5,5,0);
	}else instance_deactivate_layer("pause_menu");	
}
	
	
	