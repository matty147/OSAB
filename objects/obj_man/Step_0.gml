if(!scene1_manager.guards){
	if(!scene1_manager.stoped){
		vspeed = -1;
		x += 2;
	}
	else{
		vspeed = 0;
		x += 0;
	}

	if (x >= 850 && !scene1_manager.stoped) { 
	    scene1_manager.stoped = true;
	    alarm[0] = 80;
	}

	if (image_alpha < 1 && !fading_out) {
			image_alpha += 0.05;
		    if (image_alpha > 1) {
		        image_alpha = 1;
			
	    }
	}
}
