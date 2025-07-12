if checkpoint_manager.checkpoint_list[checkpoint_manager.current_level].checkpoint_id == checkpoint_id// && place_meeting(x,y,obj_player)
{
	if place_meeting(x,y,obj_level_player)
	{
		popup_size = 0.25;

		info_box.visible = true;
	}else 
	{	
		popup_size = 0.01;
	}
	
	//info_box.image_xscale  = lerp(info_box.image_xscale , popup_size, 0.1);
	//info_box.image_yscale  = lerp(info_box.image_yscale , popup_size, 0.1);
}else info_box.visible = false;
