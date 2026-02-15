audio_master_gain(global.volume);
audio_stop_all();

current_index = global.checkpoint[1];
global.runtime = global.checkpoint[0];
current_checkpoint_index = global.checkpoint[2];

show_debug_message($"run {global.runtime} vs {global.checkpoint}");

win = false;

read_file = false;

end_game = 250;

player = instance_find(obj_player,0);

//load file

level_data = undefined;

if (file_exists(global.level_name))
{

	var json = "";

	var file = file_text_open_read(global.level_name);

	while(file_text_eof(file) == false)
	{
		json += file_text_readln(file);
	}
	
	file_text_close(file);

	level_data = json_parse(json);

}

meta = level_data.meta;
objects = level_data.level;

meta.checkpoints = variable_struct_exists(meta, "checkpoints") ? meta.checkpoints : [];

show_debug_message($"meta.id: {meta.id}");
show_debug_message($"meta.name: {meta.name}");
show_debug_message($"meta.description: {meta.description}");
show_debug_message($"meta.lenght: {meta.lenght}");
show_debug_message($"meta.difficulty: {meta.diff}");
show_debug_message($"meta.checkpoints: {meta.checkpoints}");

show_debug_message($"objects {objects[0]}");

show_debug_message($"level lenght: {array_last(objects).time}");

show_debug_message("finished");
read_file = true;

show_debug_message("object count: " + string(array_length(objects)));

if (array_length(objects) <= 0)
{
	show_message("Error: This level contains no content! Returning to the main menu.");
	room_goto(main_menu);
}

var path = filename_dir(global.level_name) + "\\*.ogg";
//var path = folder + "\\*";

show_debug_message(path);

search = file_find_first(path, fa_directory);
file_find_close();

show_debug_message("found song: " + string(search));

if (search != "")
{
	pitch = 1.0;
	sound_id = audio_create_stream(filename_dir(global.level_name) + "\\" + search);
}

show_debug_message("glob: " + (string(global.cleared) + "(level_load)"));
show_debug_message("stor: " + (string(global.story_level) + "(level_load)"));

audio_deleted = 0;

if (array_length(global.input_map) <= 0)
{
	array_push(global.input_map,INPUT_METHODS.KEYBOARDS);
}

player_amount = clamp(array_length(global.input_map),1,4);

keyboard_user_id = 0;
controller_used = 0;

for (var p = 0; p < player_amount; p++)
{
	var rand_range = 100;
	
	var randx = random_range(-rand_range,rand_range);
	var randy = random_range(-rand_range,rand_range);
	
	var inp_player = instance_create_layer(room_width / 2 + randx,room_height / 2 + randy,"main",obj_player);
	inp_player.player_ide = p - controller_used;
	inp_player.p_device = (is_array(global.input_map[p])) ? "controller" : "keyboard";
	inp_player.player_number = p;
	
	if (is_array(global.input_map[p]))
	{
		inp_player.controller_id = global.input_map[p][1];
		controller_used++;
	}else
	{
		inp_player.keyboard_id = keyboard_user_id;
		keyboard_user_id++;
	}
	
	switch (p)
	{
		case 0:
			inp_player.sprite_index = spr_player;
		break;
		
		case 1:
			inp_player.sprite_index = spr_player_yellow;
		break;
		
		case 2:
			inp_player.sprite_index = spr_player_orange;
		break;
		
		case 3:
			inp_player.sprite_index = spr_player_green;
		break;
		
		default:
			inp_player.sprite_index = spr_player;
		break;
	}
}

all_playes_dead = false;

display_score_board = false;
already_shown_score_board = false;
default_scoreboard_display_time = 750; 

level_length = 0;

scoreboard_manager = instance_find(obj_points_scoreboard_manager,0);

// show_debug_message($"the current checkpoint values are : {global.checkpoint[0]} {global.checkpoint[1]} {global.checkpoint[2]}");