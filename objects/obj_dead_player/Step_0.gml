
image_index = player_ide;

if (x < -100)
{
    instance_destroy();
}

if (loader.all_playes_dead)
{
    instance_destroy();
}


if (!global.pause)
{
    t = (t + increment) mod 360;
    shift = amplitude * dsin(t);
    
    //clone the movement from the object's speed and direction
    yy += vspeed;
    y = yy + shift; //vertical wave motion
    
    x -= x_speed;
}

inactive = clamp(inactive - 1,0,inactive);

if (inactive == 0 && place_meeting(x,y,obj_player))
{
	var p_saved = instance_nearest(x,y,obj_player);
	p_saved.remember_data[? "revive"]++; 
	
    var player = instance_create_depth(p_saved.x,p_saved.y,depth,obj_player);
    player.player_ide = player_ide;
    player.hit_cooldown = 50;
    player.p_device = device;
    player.controller_id = controller_id;
    player.remember_data = points;
    
	switch (player_ide)
	{
		case 0:
			player.sprite_index = spr_player;
		break;
		
		case 1:
			player.sprite_index = spr_player_yellow;
		break;
		
		case 2:
			player.sprite_index = spr_player_orange;
		break;
		
		case 3:
			player.sprite_index = spr_player_green;
		break;
		
		default:
			player.sprite_index = spr_player;
		break;
	}
    
    instance_destroy();
}
