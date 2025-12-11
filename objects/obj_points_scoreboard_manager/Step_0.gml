// show_debug_message(player_stats);

if (score_board_display_time > 0)
{
    if (score_instances == noone)
    {
        for (var i = 0; i < player_numb; i++)
        {
            var pstat = player_stats[i];
            
            var rank = RANKS.F; 
            var hits = pstat[? "hit"];
            var death = pstat[? "death"];
            
            if (hits == 0)
            {
                rank = RANKS.S;
            }else if (hits <= 2)
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
}
