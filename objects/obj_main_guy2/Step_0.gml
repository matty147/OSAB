if(moving){
	x += 2;

	var new_y = y;
	while (!place_meeting(x, new_y, obj_grass) && new_y < room_height) {
	    new_y += 1;
	}


	y = new_y - sprite_height / 2 + 23;
}

if(x == 361 && !stoped){
	stoped = true;
	moving = false;
	alarm[0] = 5 * room_speed;
}

if(x == 761){
	moving = false;
}