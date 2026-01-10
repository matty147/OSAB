// wait until the user is on the checkpoint until letting them move 
if (player.on_checkpoint)
{
	current_level += keyboard_check_pressed(ord("D")) - keyboard_check_pressed(ord("A"));
	current_level += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
}

current_level = clamp(current_level,0,global.cleared_levels);

if (current_level > checkpoints_numb - 1)
{
	current_level = checkpoints_numb - 1;
}