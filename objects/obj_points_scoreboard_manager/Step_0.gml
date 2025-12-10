if (live_call()) return live_result;

if (true)
{
    if (score_instances == noone)
    {
        for (var i = 0; i < player_numb; i++)
        {
            var scoreb = instance_create_layer(x, y,"scoreboard",obj_points_scoreboard);
            var spacing = scoreb.sprite_height * 0.7;
            var total_height = scoreb.sprite_height + (player_numb - 1) * spacing - 20;
                scoreb.x = room_width / 2 + (scoreb.sprite_width) / 2;
                scoreb.y = (room_height - total_height) / 2 + i * (scoreb.sprite_height * 0.5 + spacing);
                score_instances = scoreb;
        }
    }
}