var dash = keyboard_check_pressed(vk_shift)
var move_x = keyboard_check(ord("D")) - keyboard_check(ord("A"))
var move_y = keyboard_check(ord("S")) - keyboard_check(ord("W"))


if dash == 1
{
	dash_speed = 10;
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