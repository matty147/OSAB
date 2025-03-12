view_enabled = true;
view_visible[0] = true;

view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = 1366;
view_hport[0] = 768;

view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, 0, 0, 400, 250);

zoom_active = false;
zoom_speed = 0.03;
zoom_target = 1.1;
camera_zoom = 1;