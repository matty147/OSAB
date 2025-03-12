if(!scene1_manager.guards){
	if (!scene1_manager.stoped && !moving_arc) {
	    vspeed = -1;
	    x += 2;
	} 
	else if (scene1_manager.stoped && !moving_arc) {
	    vspeed = 0;
	    start_x = x;
	    start_y = y;
	    moving_arc = true;
	}

	if (moving_arc) {
	    arc_progress += 0.02;

	    if (arc_progress >= 1) {
	        arc_progress = 1;
	        moving_arc = false;
	        fading_out = true;
	    }

	    var mid_x = (start_x + target_x) / 2; 
	    var mid_y = min(start_y, target_y) - 200;

	    var t = arc_progress;
	    x = (1 - t) * (1 - t) * start_x + 2 * (1 - t) * t * mid_x + t * t * target_x;
	    y = (1 - t) * (1 - t) * start_y + 2 * (1 - t) * t * mid_y + t * t * target_y;

	    image_angle += 5;
	}

	if (fading_out) {
	    image_alpha -= 0.02;
	    if (image_alpha <= 0) {
	        instance_destroy();
	        scene1_manager.stoped = false;
	        fading_out = false;

	        instance_create_layer(612, 639, "animation", obj_blue_squere);
	    }
	}

	if (image_alpha < 1 && !fading_out) {
	    image_alpha += 0.05;
	    if (image_alpha > 1) {
	        image_alpha = 1;
	    }
	}
}