if(moving){
	x += 2;

	var new_y = y;
	while (!place_meeting(x, new_y, obj_grass) && new_y < room_height) {
	    new_y += 1;
	}


	y = new_y - sprite_height / 2 + 52;
}

if(x == 241 && !stoped){
	stoped = true;
	moving = false;
	alarm[0] = 5 * room_speed;
}

if(x == 671){
	moving = false;
	obj_glow.visible = true;
}
