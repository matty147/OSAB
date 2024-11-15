image_angle += wiggle_speed * direction_y;

if (image_angle >= previous_angle + 20) {
    direction_y = -1;
} else if (image_angle <= previous_angle - 20) {
    direction_y = 1;
}
