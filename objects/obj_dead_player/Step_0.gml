
image_index = player_ide;

if (x < -100) // should improve this in the future bc this is crap
{
    x = -300;
    x_speed = 0;
    visible = false;
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

// show_debug_message(checkpoint_hit);

if (inactive == 0 && place_meeting(x,y,obj_player) || checkpoint_hit)
{
	checkpoint_hit = false;
	
	var p_saved = instance_nearest(x,y,obj_player);
	
	var _x = room_width / 2;
	var _y = room_height / 2;
	
	if (instance_exists(p_saved))
	{
		p_saved.remember_data[? "revive"]++;
		_x = p_saved.x;
		_y = p_saved.y;
	}
	
    var player = instance_create_depth(_x,_y,depth,obj_player);
    player.player_ide = player_ide;
    player.hit_cooldown = 50;
    player.p_device = device;
    player.controller_id = controller_id;
    player.remember_data = points;
    player.vibration_amount = 1.5;
    player.sprite_index = player_sprite;
    
    instance_destroy();
}

if (inactive == 0) {gamepad_set_vibration(controller_id, 0, 0);}
