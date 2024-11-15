
y += direction_y * speed_y;



if (y >= previous_y+20) {
    direction_y = -1; 
} else if (y <= previous_y-20) {
    direction_y= 1; 
}
