
if (mouse_check_button_pressed(mb_left) &&  instance_position(mouse_x,mouse_y,id))
{
    parent.inp_dropdown_text = display_text;
    parent.update_value = true;
}