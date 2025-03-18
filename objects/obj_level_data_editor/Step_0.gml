
if keyboard_check_pressed(ord("O"))
{
	//visible = !visible;
	hidden = !hidden;
}

if hidden
{
	image_alpha	= 0;
	x = hidden_x;
	y = hidden_y;
}else
{
	image_alpha = 1;

	x = default_x;
	y = default_y;
}