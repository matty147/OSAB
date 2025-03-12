if(moving){
	x += 2;

	var new_y = y;
	while (!place_meeting(x, new_y, obj_grass) && new_y < room_height) {
	    new_y += 1;
	}


	y = new_y - sprite_height / 2 + 77;
}

if(x == 971){
	moving = false;
}
