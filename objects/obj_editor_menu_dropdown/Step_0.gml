if (live_call()) return live_result;

if mouse_check_button_pressed(mb_left)
{
	if position_meeting(mouse_x,mouse_y, obj_editor_menu_dropdown)
	|| position_meeting(mouse_x,mouse_y, obj_editor_menu_dropdown_bg)
	//|| position_meeting(mouse_x,mouse_y, obj_editor_menu_dropdown_button)
	{
		open = true;
	}else open = false;
	
}

if open
{
	if inp_menu == noone
	{	
		inp_menu = instance_create_layer(x,y + sprite_height ,"objects",obj_editor_menu_dropdown_bg);
		inp_menu.image_yscale = (((option_numbers - 1) * 64) + ((option_numbers - 1) * button_space) + 10) / sprite_height;
		inp_menu.image_xscale = 4;
	
		for (var o = 0; o < option_numbers - 1; o++)
		{
			var inp_but = instance_create_layer(x + 10,inp_menu.y + 10 + (button_space + 64) * o,"objects",obj_editor_menu_dropdown_button);
			inp_but.depth = inp_menu.depth - 1;
			inp_but.image_xscale = 3.65;
			inp_but.icon_id = o;
			inp_but.display_text = option_text[o]; // check if it exists first tho
		}
	}
}else 
{
	if inp_menu != noone
	{
		instance_destroy(inp_menu);
		inp_menu = noone;
	}
	
	with (obj_editor_menu_dropdown_button) {instance_destroy();}
}