var checkpoint = checkpoint_manager.checkpoint_list[checkpoint_manager.current_level];


if checkpoint.visible
{
	_x = checkpoint.x;
	_y = checkpoint.y;
}

if point_distance(x,y,_x,_y) > 1
{

	x = lerp(x,_x,0.1);
	y = lerp(y,_y,0.1);
	
}

if keyboard_check_pressed(ord("K")) && place_meeting(x,y,obj_checkpoint)
{
	if checkpoint_manager.checkpoint_list[checkpoint_manager.current_level].cleared == false
	{
		global.cleared_levels++;
		checkpoint_manager.checkpoint_list[checkpoint_manager.current_level].cleared = true;
	}
}

if keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)
{
	if place_meeting(x,y,obj_checkpoint)
	{
		audio_play_sound(snd_level_enter,0,false);
		//global.level_name = "levels\\test\\test.osab";
		global.story_level = true;
		global.cleared = checkpoint_manager.checkpoint_list[checkpoint_manager.current_level].cleared;
		global.level_name = checkpoint_manager.checkpoint_list[checkpoint_manager.current_level].level_name;
		show_debug_message("started: " + string(global.level_name) + "\ncleared: " + string(global.cleared));
		
		room_goto(checkpoint_manager.checkpoint_list[checkpoint_manager.current_level].cutscene);	
	}
}

//view_camera[0] = 