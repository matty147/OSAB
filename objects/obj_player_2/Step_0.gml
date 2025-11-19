
var dash = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(vk_space);

var move_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
if (move_x == 0)
{
	move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
}

var move_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));
if (move_y == 0)
{
	move_y = keyboard_check(vk_down) - keyboard_check(vk_up);
}

if (move_x != 0 || move_y != 0) {
    var length = sqrt(sqr(move_x) + sqr(move_y));
    move_x /= length;
    move_y /= length;
}

// horizontal
for (var i = 0; i < 10; i++)
{
	if (!place_meeting(x + move_x * _speed,y,obj_wall) && x > 0 && x < room_width)
	{
		x += move_x * _speed;
		break;
	}
	_speed -= 1;
}
_speed = def_speed;

//vertical
for (var i = 0; i < 10; i++)
{
	if (!place_meeting(x,y  + move_y * _speed,obj_wall) && y > 0 && y < room_height)
	{
		y += move_y * _speed;
		break;
	}
	_speed -= 1;
}
_speed = def_speed;


if (keyboard_check(vk_anykey))
{
	image_angle = lerp(image_angle,	arctan2(move_y * -1 ,move_x) * (180 / pi),0.25);
}