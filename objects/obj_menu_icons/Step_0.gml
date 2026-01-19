
if (position_meeting(mouse_x,mouse_y,id))
{
    image_size = 1.25;
}else image_size = 1;

image_xscale += (image_size - image_xscale) * 0.1;
image_yscale += (image_size - image_yscale) * 0.1;

if (position_meeting(mouse_x,mouse_y,id) && mouse_check_button_pressed(mb_left))
{
    show_debug_message(link);
    url_open(link);
}