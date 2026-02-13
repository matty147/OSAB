
if (!global.pause && !checkpoint_hit)
{
    visible = true;
    x -= move_speed;
    
    // var nearest_player = instance_nearest(x,obj_player);
    
    var active_players = instance_number(obj_player);
    
    var closest_distance = 9999;
    
    for (var p = 0; p < active_players; p++)
    {
        // show_debug_message(closest_distance);
        
        var player = instance_find(obj_player,p);
        
        // show_debug_message(abs(x - player.x));
        
        if (abs(x - player.x) < closest_distance)
        {
            closest_player = player;
            closest_distance = abs(x - player.x);
        }
    }
    
    if (instance_exists(closest_player))
    {
        with (closest_player)
        {
            var level_checkpoint = instance_find(obj_level_checkpoint,0);
            
            if (abs(x - level_checkpoint.x) < 20)
            {
                audio_play_sound(snd_checkpoint_reached,0,false);
                
                instance_destroy(level_checkpoint);
                
                show_debug_message("SAVED score!!!");
                global.pre_scoreboard_data = obj_points_scoreboard_manager.player_stats; // saves even before the user can get to it so the stats are inacurate D:
                
                with (obj_dead_player)
                {
                    checkpoint_hit = true;
                }
            }
        }
    }
}else visible = false;