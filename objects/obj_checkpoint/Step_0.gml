var curent_checkpoint = checkpoint_manager.checkpoint_list[checkpoint_manager.current_level];

if cleared
{	
	if checkpoint_manager.current_level + 1 < checkpoint_manager.checkpoints_numb && checkpoint_id == checkpoint_manager.current_level
	{
		checkpoint_manager.checkpoint_list[checkpoint_manager.current_level + 1].visible = true;
	}
}


if keyboard_check_pressed(ord("B"))
{
	room_goto(level_select);
}