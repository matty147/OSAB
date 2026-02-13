var curent_checkpoint = checkpoint_manager.checkpoint_list[checkpoint_manager.current_level];

if (cleared) // display lock if the level is not cleared
{	
	if (checkpoint_manager.current_level + 1 < checkpoint_manager.checkpoints_numb && checkpoint_id == checkpoint_manager.current_level)
	{
		checkpoint_manager.checkpoint_list[checkpoint_manager.current_level + 1].visible = true;
	}
}