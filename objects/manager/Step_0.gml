if room == level_select ||  room == editor
{

	if keyboard_check_pressed(vk_escape)
	{
		room_goto(main_menu);	
	}
	
	window_set_cursor(cr_none);
}

if room == level_select
{
	
	if !audio_is_playing(snd_story_level_bg)
	{
		audio_play_sound(snd_story_level_bg,0,true);
	}
	
}

if room = level 
{
	
	if keyboard_check_pressed(vk_escape)
	{
		global.pause = !global.pause;
	}
	
	if !global.pause
	{
		window_set_cursor(cr_none);
	}else window_set_cursor(cr_default);
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
		in_main_menu = true;
	
		instance_activate_layer("main");
		instance_activate_layer("main_spawned");
		instance_deactivate_layer("level_buttons");
		instance_deactivate_layer("options");
		instance_deactivate_layer("options_spawned");
		instance_deactivate_layer("credits");
		instance_deactivate_layer("level_select");
		break;
	
	case "1": // level select
		button_max = 10;
		button_repeat = true;
		in_main_menu = false;
	
		instance_deactivate_layer("main");
		instance_deactivate_layer("main_spawned");
		instance_deactivate_layer("options");
		instance_deactivate_layer("options_spawned");
		instance_deactivate_layer("credits");
		instance_activate_layer("level_select");
		instance_activate_layer("level_buttons");
		break;
	
	case "2": // options
		button_repeat = false;
		button_max = 3;
		in_main_menu = false;
	
		instance_deactivate_layer("main");
		instance_deactivate_layer("main_spawned");
		instance_activate_layer("options");
		instance_activate_layer("options_spawned");
		instance_deactivate_layer("credits");
		instance_deactivate_layer("level_select");
		instance_deactivate_layer("level_buttons");
		break;
	
		case "21":
		in_main_menu = false;
		break;
	
	case "3": // credits
		in_main_menu = false;
		room_goto(editor);
	
		//button_repeat = false;
		//button_max = 0;	
		//instance_deactivate_layer("main");
		//instance_deactivate_layer("options");
		//instance_activate_layer("credits");
		//instance_deactivate_layer("level_select");
		//instance_deactivate_layer("level_buttons");
		break;
	
	case "31":
		var _editor = instance_find(obj_editor,0);
		_editor.save = true;
		show_debug_message("saving");
		menu_id = -1;
		break;
	case "32":
		var _editor = instance_find(obj_editor,0);
		_editor.load = true;
		show_debug_message("loading");
		menu_id = -1
		break;
}

if move_buttons != 0 && room == main_menu && menu_id == "1"
{
	if !audio_is_playing(snd_button)
	{
		audio_play_sound(snd_button,2,false);
	}
}


//if keyboard_check_pressed(vk_tab) && keyboard_check(vk_control) // open console menu
//{
//	global.debug = !global.debug;
//}

//if global.debug
//{
//	show_debug_log(true);
//}else show_debug_log(false);

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

if room == main_menu
{
	if menu_id != 1
	{
		if !audio_is_playing(snd_menu_bg)
		{
			show_debug_message("plaing bg music" + string(room_get_name(room)));
			audio_stop_all();
			audio_play_sound(snd_menu_bg,0,true,1,9);
		}
	}else audio_stop_sound(snd_menu_bg);
	
}else{

if audio_is_playing(snd_menu_bg)
{
	show_debug_message("stoped bg music");
	audio_stop_sound(snd_menu_bg);
}
	
}

