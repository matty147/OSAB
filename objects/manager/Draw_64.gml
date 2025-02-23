draw_self();

if room == level
{
	var player = instance_find(obj_player,0);
	var loader = instance_find(level_load,0);
	if global.pause //temp
	{
		if player.dead
		{
			draw_set_alpha(0.25);

			draw_set_color(c_red);

			draw_rectangle(0, 0, room_width, room_height, false);

			draw_set_alpha(1);
			
			instance_activate_layer("death_menu");
			draw_text_transformed(room_width * 1/2,room_height * 1/4,"You Failed",5,5,0);
		}else if loader.win
		{
			
			draw_set_alpha(0.25);

			draw_set_color(c_yellow);

			draw_rectangle(0, 0, room_width, room_height, false);

			draw_set_alpha(1);
			
			
			instance_activate_layer("win_menu");
			draw_text_transformed(room_width * 1/2,room_height * 1/4,"Level completed!",5,5,0);	
		}else
		{
			instance_activate_layer("pause_menu");
			draw_text_transformed(room_width * 3/4,room_height * 1/4,"Paused",5,5,0);	
		}
		
		
	}else
	{
		instance_deactivate_layer("pause_menu");	
		instance_deactivate_layer("death_menu");		
		instance_deactivate_layer("win_menu");		
	}
}
	
	
	