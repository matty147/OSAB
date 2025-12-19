function check_achievements_conditions(stats)
{
    // var ach = [5,10,60,20,1,40];
    var ach = [[["Nothing","You did absolutely nothing this round"],-1]];
    
    
    if (player_numb == 3)
    {
        array_push(ach,[["Full Blast","Play a match with 4 players"],0]);
    }
    
    if (stats[? "revive"] >= 1)
    {
        array_push(ach,[["Hero","Revived your teammates many times"],4]);
    }
    
    if (stats[? "dash"] > 10)
    {
        array_push(ach,[["I Am Speed","Dashed way too much"],3]);
    }
    
    if (stats[? "corner_cmap"] > 10)
    {
        array_push(ach,[["Corner Lover","Spent most of the level hiding in a corner"],2]);
    }
    
    if (stats[? "afk"] > 10)
    {
        array_push(ach,[["Are You Even There?","Moved very little during the level"],1]);
    }
    
    if (stats[? "moved_distance"] > 10)
    {
        array_push(ach,[["Hyperactive","Moved far more than necessary"],2]);
    }
    
    if (stats[? "alone_time_alive"] > 10 && player_numb > 1)
    {
        array_push(ach,[["Lone Alpha","Survived most of the level without teammates"],5]);
    }
    
    // sort the array form heighest to lowest
    var _f = function(numb1, numb2)
    {
        return numb1[1] - numb2[1];
    }
    
    array_sort(ach, _f);
    
    ach = array_reverse(ach);
    
    show_debug_message($"this is the whole array: {ach}");
    
    lach = [];
    
    //there are better ways of doing this.
    for (var l = 0;l < array_length(ach); l++)
    {
        if (l == 3){break;}
        array_push(lach,ach[l]);
    }
    
    return lach;
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
            
            
            show_debug_message($"player: {i}");
            achievement = check_achievements_conditions(pstat);
            show_debug_message($"This is the top 3: {achievement}");
            show_debug_message("----------------/n");
            
            var scoreb = instance_create_layer(x, y,"scoreboard",obj_points_scoreboard);
            var spacing = scoreb.sprite_height * 0.7;
            var total_height = scoreb.sprite_height + (player_numb - 1) * spacing - 20;
                scoreb.x = room_width / 2 + (scoreb.sprite_width) / 2;
                scoreb.y = (room_height - total_height) / 2 + i * (scoreb.sprite_height * 0.5 + spacing);
                score_instances = scoreb;
                scoreb.rank = rank;
                scoreb.achievment_names = achievement;
        }
    }
}else
{
    with (obj_points_scoreboard) {instance_destroy();}
    score_instances = noone;
}

if (global.pause) {with (obj_points_scoreboard) {instance_destroy();} score_instances = noone;}
