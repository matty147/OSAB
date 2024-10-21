if !global.pause
{

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

	////moves in one directioncx
	x += cos(real(angle) * (pi / 180)) * real(_speed);
	y += sin(real(angle) * (pi / 180)) * real(_speed);


	//wave only on the y part
	//x += cos(real(angle) * (pi / 180)) * real(_speed);
	//y += sin(real(angle) * (pi / 180)) * real(_speed) + sin(real(wave_angle) * (pi / 180)) * amplitude;

	//wave_angle += frequency;




	////same thing?
	//x += real(_speed); // Moves horizontally at constant speed
	//y += sin(real(wave_angle) * (pi / 180)) * amplitude; // Moves in a wave pattern vertically




	//moves there and back

	//// Variables to control the wave
	//var wave_amplitude = 10; // Size of the wave
	//var wave_frequency = 0.005; // Speed of the wave oscillation //0.005
	//var wave_offset = sin(current_time * wave_frequency) * wave_amplitude; // Calculate the wave offset based on time

	//// Main movement in the direction of the angle
	//x += cos(real(angle) * (pi / 180)) * real(_speed);
	//y += sin(real(angle) * (pi / 180)) * real(_speed);

	//// Add wave motion perpendicular to the movement direction
	//x += cos((real(angle) + 90) * (pi / 180)) * wave_offset;
	//y += sin((real(angle) + 90) * (pi / 180)) * wave_offset;
}

