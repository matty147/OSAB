current_level += keyboard_check_pressed(ord("D")) - keyboard_check_pressed(ord("A"));
current_level += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);

//show_debug_message(current_level);

if current_level < 0
{
	current_level = 0;
}else if current_level > global.cleared_levels
{
	current_level = global.cleared_levels;
}
if current_level > checkpoints_numb - 1
{
	current_level = checkpoints_numb - 1;
}