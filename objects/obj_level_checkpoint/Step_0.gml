
if (!global.pause && !checkpoint_hit)
{

    x -= move_speed;
    
    with (obj_player)
    {
        var level_checkpoint = instance_find(obj_level_checkpoint,0);
        
        if (abs(x - level_checkpoint.x) < 20)
        {
            instance_destroy(level_checkpoint);
            
            with (obj_dead_player)
            {
                checkpoint_hit = true;
            }
        }
    }

}