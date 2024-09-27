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

//calculates the movement direction and then translates it from deg to rad
x += cos(real(angle) * (pi / 180)) * real(_speed);
y += sin(real(angle) * (pi / 180)) * real(_speed);
