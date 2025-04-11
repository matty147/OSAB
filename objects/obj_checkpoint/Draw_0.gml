draw_self();

if checkpoint_id + 1 < checkpoint_manager.checkpoints_numb && cleared
{
	var next_checkpoint = checkpoint_manager.checkpoint_list[checkpoint_id + 1];
	if checkpoint_manager.checkpoint_list[checkpoint_id + 1].boss_level
	{
		draw_line_width_color(x,y,next_checkpoint.x,next_checkpoint.y,10,c_white,c_purple);
	}else draw_line_width_color(x,y,next_checkpoint.x,next_checkpoint.y,10,c_white,c_white);
}
//draw_text(x,y - sprite_height,cleared);
