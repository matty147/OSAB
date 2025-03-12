image_angle -= angle_speed * angle_direction;
if (image_angle > 10 || image_angle < -10) {
    angle_direction *= -1;
}
