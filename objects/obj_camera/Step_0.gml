if (zoom_active) {
    camera_zoom = lerp(camera_zoom, zoom_target, zoom_speed);
    
    var new_w = 640 / camera_zoom;
    var new_h = 480 / camera_zoom;
    
    var new_x = lerp(camera_get_view_x(view_camera[0]), 240 - new_w / 2, zoom_speed);
    var new_y = lerp(camera_get_view_y(view_camera[0]), 560 - new_h / 2, zoom_speed);
    
    camera_set_view_pos(view_camera[0], new_x, new_y);
    camera_set_view_size(view_camera[0], new_w, new_h);

    if (abs(camera_zoom - zoom_target) < 0.01) {
        zoom_active = false;
    }
}
