draw_self();

if checkpoint_id + 1 < checkpoint_manager.checkpoints_numb && cleared
{
	var next_checkpoint = checkpoint_manager.checkpoint_list[checkpoint_id + 1];
	draw_line_width_color(x,y,next_checkpoint.x,next_checkpoint.y,5,c_orange,c_orange);
}
//draw_text(x,y - sprite_height,cleared);
