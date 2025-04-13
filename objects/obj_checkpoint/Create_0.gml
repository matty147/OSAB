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