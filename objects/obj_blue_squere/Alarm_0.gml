image_alpha -= 0.05;

if (image_alpha <= 0) {
    instance_destroy();
    scene1_manager.stoped = false;
    fading_out = false;

    instance_create_layer(624, 653, "Instances", obj_blue_squere);
} else {
    alarm[0] = 1;
}