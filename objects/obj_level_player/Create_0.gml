image_speed = 0;
image_index = 0;

checkpoint_manager = instance_find(obj_checkpoint_manager,0);

if checkpoint_manager.current_level < instance_number(obj_checkpoint)
{
	x = checkpoint_manager.checkpoint_list[checkpoint_manager.current_level].x;
	y = checkpoint_manager.checkpoint_list[checkpoint_manager.current_level].y;
} else 
{
	x = checkpoint_manager.checkpoint_list[checkpoint_manager.current_level - 1].x;
	y = checkpoint_manager.checkpoint_list[checkpoint_manager.current_level - 1].y;
}

_x = x;
_y = y;

useing_controller = false;