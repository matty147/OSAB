// if (live_call()) return live_result;

draw_self();

if (room == level)
{
	var loader = instance_find(level_load,0);
	var scoreboard = instance_find(obj_points_scoreboard_manager,0);
	if (global.pause && !scoreboard.display_score_board <= 0)
	{
		if (loader.all_playes_dead)
		{
			draw_set_alpha(0.25);

			draw_set_color(c_red);

			draw_rectangle(0, 0, room_width, room_height, false);

			draw_set_alpha(1);
			
			instance_activate_layer("death_menu");
			draw_text_transformed(room_width * 1/2,room_height * 1/4,"You Failed",5,5,0);
		}else if (loader.win)
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
}else if (room == level_select)
{
	draw_set_alpha(0.75);
	draw_rectangle_color(0,room_height - 50,300,room_height,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
	draw_rectangle_color(room_width,room_height - 50,room_width - 1200,room_height,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
	draw_set_alpha(1);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	draw_text_ext_transformed_color(10,room_height - 5,"Press [ESC] to exit",20,250,2,2,0,c_white,c_white,c_white,c_white,1);
	
	draw_set_halign(fa_right);
	draw_text_ext_transformed_color(room_width - 570,room_height - 5,"Press [Enter] or [SPACE] to enter a level",20,400,2,2,0,c_white,c_white,c_white,c_white,1);
}
	
	