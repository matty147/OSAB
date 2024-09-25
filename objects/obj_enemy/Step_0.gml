if survive_speed < 0
{
	instance_destroy();
}

if show_hitbox < 0
{
	survive_speed--;
	hitbox = true;
}else show_hitbox--;

if hitbox == true
{
	image_alpha = 1; 
}