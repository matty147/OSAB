// show_debug_message(score_board_display_time);

if (score_board_display_time > 50)
{
    // show_debug_message("display");
    if (score_instances == noone)
    {
        // show_debug_message("created");
        
        for (var i = 0; i < player_numb; i++)
        {
            var pstat = player_stats[i];
            
            var rank = RANKS.F; 
            var hit = pstat[? "hit"];
            var death = pstat[? "death"];
            
            show_debug_message($"hit: {hit} deaths: {death}");
            
            if (hit == 0)
            {
                rank = RANKS.S;
            }else if (hit <= 2)
            {
                rank = RANKS.A;
            }else if (death == 1)
            {
                rank = RANKS.B;
            }else if (death >= 2)
            {
                rank = RANKS.C;
            }// else fail
            
            var scoreb = instance_create_layer(x, y,"scoreboard",obj_points_scoreboard);
            var spacing = scoreb.sprite_height * 0.7;
            var total_height = scoreb.sprite_height + (player_numb - 1) * spacing - 20;
                scoreb.x = room_width / 2 + (scoreb.sprite_width) / 2;
                scoreb.y = (room_height - total_height) / 2 + i * (scoreb.sprite_height * 0.5 + spacing);
                score_instances = scoreb;
                scoreb.rank = rank;
        }
    }
}else
{
    with (obj_points_scoreboard) {instance_destroy();}
    score_instances = noone;
}

if (global.pause) {with (obj_points_scoreboard) {instance_destroy();} score_instances = noone;}
