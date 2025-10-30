if mouse_check_button_pressed(mb_left)
{
	
	if position_meeting(mouse_x,mouse_y, obj_editor_menu_dropdown)
	{
		open = !open;
	}else open = false;
	
}

if open
{
	if inp_menu == noone
	{	
		inp_menu = instance_create_layer(x,y,"objects",obj_editor_menu_dropdown_bg);
	
		for (var o = 0; o < option_numbers - 1; o++)
		{
			instance_create_layer(x,y + button_space * o,"objects",obj_editor_menu_dropdown_button);
		}
	}
}