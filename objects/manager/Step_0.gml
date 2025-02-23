if shortcuts_on
{
	if keyboard_check_pressed(ord("R")) && keyboard_check(vk_control)
	{
		game_restart();
	}

	//if keyboard_check_pressed(ord("S")) && keyboard_check(vk_control) && room == editor
	//{
	//	scr_save_level("test.osab","");
	//}

	//if keyboard_check_pressed(ord("E")) 
	//{
	//	room_goto(editor);
	//}

	//these will be buttons on the menu but for the time being they are here

	if keyboard_check_pressed(ord("M")) && global.pause
	{
		room_goto(main_menu);
	}

	if keyboard_check_pressed(ord("R")) && global.pause
	{
		room_restart();
	}
}

if room = level && keyboard_check_pressed(vk_escape)
{
	
global.pause = !global.pause;
	
}

if !global.pause
{
	//global.runtime += time_line.distance / (5 * room_speed); //timeline.distance only exists in the editor while this code runs anywhere
	global.runtime += 85 / (5 * room_speed);
	//show_debug_message(global.runtime);

	//show_debug_message(global.runtime);

}	

		button += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	
	if !button_repeat // if the user is not in the level select screen
	{
		if button > button_max // check if the button is not going outside the buttonss
		{
			button = button_max;
		}else if button < 0
		{
			button = 0;	
		}
	}else if button > button_max	
		{
			button -= button_max + 1;	
		}else if button < 0
		{
			button += button_max + 1;
		}
	
move_buttons = mouse_wheel_up() - mouse_wheel_down();

if move_buttons == 0
{
	move_buttons = (keyboard_check_pressed(vk_up) - keyboard_check_pressed(vk_down)) * 4.5; // find the right value for this so that the buttons dont move
	//if button = NaN
	//{
	//	button = 0;
	//}
}

switch menu_id
{
	
	case "0": // main menu
		button_repeat = false;
		button_max = 3;
	
		instance_activate_layer("main");
		instance_deactivate_layer("level_buttons");
		instance_deactivate_layer("options");
		instance_deactivate_layer("credits");
		instance_deactivate_layer("level_select");
		break;
	
	case "1": // level select
		button_max = 10;
		button_repeat = true;
	
		instance_deactivate_layer("main");
		instance_deactivate_layer("options");
		instance_deactivate_layer("credits");
		instance_activate_layer("level_select");
		instance_activate_layer("level_buttons");
		break;
	
	case "2": // options
		button_repeat = false;
		button_max = 3;
	
		instance_deactivate_layer("main");
		instance_activate_layer("options");
		instance_deactivate_layer("credits");
		instance_deactivate_layer("level_select");
		instance_deactivate_layer("level_buttons");
		break;
		
	case "3": // credits
	
		room_goto(editor);
	
		//button_repeat = false;
		//button_max = 0;	
		//instance_deactivate_layer("main");
		//instance_deactivate_layer("options");
		//instance_activate_layer("credits");
		//instance_deactivate_layer("level_select");
		//instance_deactivate_layer("level_buttons");
		break;
		
	case "21":
		break;
}

if move_buttons != 0 && room == main_menu && menu_id == "1"
{
	audio_play_sound(snd_menu,2,false);	
}


if keyboard_check_pressed(vk_tab) && keyboard_check(vk_control) // open console menu
{
	global.debug = !global.debug;
}

if global.debug
{
	show_debug_log(true);
}else show_debug_log(false);

//check what type of click is happening
//var 'clickdouble': 0=noclick, 1=singleclick, 2=doubleclick
mdoubleclick--;
if (mdoubleclick < 0)
{
	clickdouble = 0;
}

if (mouse_check_button_pressed(mb_left) && mdoubleclick >= 0 && clickdouble == 0.5)
{
	clickdouble = 2;
}

if (mouse_check_button_pressed(mb_left) && mdoubleclick < 0)
{
	mdoubleclick = room_speed * 0.25;
	clickdouble = 0.5;
}

if (clickdouble == 0.5 && mdoubleclick == 0)
{
	clickdouble = 1;
}

if selected_items < 1
{
	shortcuts_on = true;	
}else shortcuts_on = false;

//show_debug_message(selected_items);
