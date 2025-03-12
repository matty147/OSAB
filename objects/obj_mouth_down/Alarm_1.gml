if (move_counter < move_amount) {
	y += move_dir;
	move_counter += 1;
	alarm[1] = 1;
} else if (move_dir == -1) {
	move_dir = 1;
	move_counter = 0;
	alarm[1] = 1;
} else {
	current_cycle += 1;
	if (current_cycle < move_cycles) {
	    move_dir = -1;
	    move_counter = 0;
	    alarm[1] = 1;
	} else {
	    alarm[0] = 240;
	}
}
