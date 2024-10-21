if !global.pause
{

	var dash = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(vk_space)
	var move_x = keyboard_check(ord("D")) - keyboard_check(ord("A"))
	var move_y = keyboard_check(ord("S")) - keyboard_check(ord("W"))

	if (move_x != 0 || move_y != 0) {
	    var length = sqrt(sqr(move_x) + sqr(move_y));
	    move_x /= length;
	    move_y /= length;
	}

	if dash == 1	
	{
		dash_speed = 8;
		inv = 30;
	}
	if dash_speed > 1
	{
		dash_speed--; 	
	}

	move_y *= dash_speed;
	move_x *= dash_speed;

	// horizontal
	for (var i = 0; i < 10; i++)
	{
		if !place_meeting(x + move_x * _speed,y,obj_wall){
			x += move_x * _speed;
			_speed = def_speed;
			break;
		}
		_speed -= 1;
	}

	//vertical
	for (var i = 0; i < 10; i++)
	{
		if !place_meeting(x,y  + move_y * _speed,obj_wall){
			y += move_y * _speed;
			_speed = def_speed;
			break;
		}
		_speed -= 1;
	}

	move_x = move;
	move_y = move;


	var _inst = instance_place(x,y,obj_enemy)
	if place_meeting(x, y, _inst) && _inst.hitbox == true && dash_speed >= 1 && inv < 0
	{
		health--;	
		inv = def_inv;
	}inv--;

	if inv > 0 && inv % 2 = 0 && dash_speed >= 1
	{
		image_index++;
	}else image_index = 0;

	if health < 0
	{
		show_debug_message("dead");
		game_end();		
	}
}
