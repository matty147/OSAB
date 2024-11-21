if (mouse_x >= x && mouse_x <= x + sprite_width && mouse_y >= y && mouse_y <= y + sprite_height) {
    global.can_interact = false;
} else {
    global.can_interact = true;
}
