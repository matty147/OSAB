
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