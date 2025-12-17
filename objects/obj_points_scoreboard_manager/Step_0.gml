function check_achivements_conditions(stats)
{
    var ach = [5,10,60,20,1,40];
    
    // sort the array form heighest to lowest
    var _f = function(numb1, numb2)
    {
        return numb1 - numb2;
    }
    
    array_sort(ach, _f);
    
    // array_reverse(ach);
    
    show_debug_message($"this is the array: {ach}");
    
    return ach;
}

if (score_board_display_time > 50)
{
    // show_debug_message("display");
    if (score_instances == noone)
    {
        // show_debug_message("created");
        
        for (var i = 0; i < player_numb; i++)
        {
            achievement = [];
            
            var pstat = player_stats[i];
            
            var rank = RANKS.F; 
            var hit = pstat[? "hit"];
            var death = pstat[? "death"];
            
            // show_debug_message($"hit: {hit} deaths: {death}");
            
            if (hit == 0 && death == 0)
            {
                rank = RANKS.S;
            }else if (hit <= 2 && death == 0)
            {
                rank = RANKS.A; // hit 3 does not exist
            }else if (hit == 3 ||death == 1)
            {
                rank = RANKS.B;
            }else if (death >= 2)
            {
                rank = RANKS.C;
            }// else fail
            
            achievement = check_achivements_conditions();
            
            var scoreb = instance_create_layer(x, y,"scoreboard",obj_points_scoreboard);
            var spacing = scoreb.sprite_height * 0.7;
            var total_height = scoreb.sprite_height + (player_numb - 1) * spacing - 20;
                scoreb.x = room_width / 2 + (scoreb.sprite_width) / 2;
                scoreb.y = (room_height - total_height) / 2 + i * (scoreb.sprite_height * 0.5 + spacing);
                score_instances = scoreb;
                scoreb.rank = rank;
                scoreb.achivment_name = "testing achivment";
        }
    }
}else
{
    with (obj_points_scoreboard) {instance_destroy();}
    score_instances = noone;
}

if (global.pause) {with (obj_points_scoreboard) {instance_destroy();} score_instances = noone;}
