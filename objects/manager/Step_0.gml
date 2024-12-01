if keyboard_check_pressed(ord("R")) && keyboard_check(vk_control)
{
	game_restart();	
}

if keyboard_check_pressed(ord("C"))
{
//	// Create and open the file in write mode
//var file = file_text_open_write("example.txt");

//// Write some text to the file
//file_text_write_string(file, "Hello, this is a line of text!");
//file_text_writeln(file); // Adds a newline after the string

//file_text_write_string(file, "This is another line.");
//file_text_writeln(file);

//// Close the file
//file_text_close(file);
//show_debug_message(working_directory);

var fileid = file_text_open_write(working_directory + "test.txt"); // C:\Users\<user>\AppData\Local\<project name> why the fuck is it there T-T
if fileid = -1 // it will go to the same place when exported fuck this
{
	show_debug_message("fuckup!!!!");
	exit;
}

file_text_write_real(fileid,69);
file_text_write_string(fileid,"hello");
file_text_close(fileid);

}


//these will be buttons on the menu but for the time being they are here

if keyboard_check_pressed(ord("M")) && global.pause
{
	room_goto(main_menu);
}

if keyboard_check_pressed(ord("R")) && global.pause
{
	room_restart();
}

if room = level && keyboard_check_pressed(vk_escape)
{
	
global.pause = !global.pause;
	
}

if !global.pause
{
	global.runtime++;

	//show_debug_message(global.runtime);

}	

		button += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	
	if !button_repeat // if the user is not in the level select screen
	{
		if button > button_max // check if the button is not going outside the buttons
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
		button_repeat = false;
		button_max = 0;
	
		instance_deactivate_layer("main");
		instance_deactivate_layer("options");
		instance_activate_layer("credits");
		instance_deactivate_layer("level_select");
		instance_deactivate_layer("level_buttons");
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