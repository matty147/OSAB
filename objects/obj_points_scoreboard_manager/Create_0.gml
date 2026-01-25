
image_speed = 0;
image_index = 0;

player_number = array_length(global.input_map);

best_achivment = "";

/*
    S = nohit
    A = 1 - 2 hit
    B = death
    C = 2 deaths
    F = multiple death / or fail
*/

enum RANKS
{
    S,
    A,
    B,
    C,
    F
}

player_numb = array_length(global.input_map);

display_score_board = true;

score_instances = noone;

player_stats = array_create(player_numb);

show_debug_message(array_length(global.pre_scoreboard_data));

if (array_length(global.pre_scoreboard_data) != 0)
{
    show_debug_message("loaded_stats");
    player_stats = global.pre_scoreboard_data;

    for (var i = 0; i < player_numb; i++)
    {
        var player = instance_find(obj_player,i);
        
        player.remember_data = player_stats[i];
    }
    
}

show_debug_message(player_stats);

show_debug_message(json_encode(player_stats[0]));
// show_debug_message(json_encode(player_stats[1]));
// show_debug_message(json_encode(player_stats[2]));
// show_debug_message(json_encode(player_stats[3]));

score_board_display_time = 0;

achievement = [];

level_length = -1;