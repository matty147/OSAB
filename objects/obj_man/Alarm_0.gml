image_alpha -= 0.05;
fading_out = true;

if (image_alpha <= 0) {
    instance_destroy();
    scene1_manager.stoped = false;
	fading_out = false;
	
	instance_create_layer(467, 592, "animation", obj_man);
} else {
    alarm[0] = 1;
}
