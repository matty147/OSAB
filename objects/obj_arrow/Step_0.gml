y = instance.y - instance.sprite_height * instance.numb_of_timelines;

if instance.hide
{
	y = room_height - sprite_height/2;
}

if position_meeting(mouse_x,mouse_y,id) && mouse_check_button_pressed(mb_left)
{	
	instance.hide = !instance.hide;	
}