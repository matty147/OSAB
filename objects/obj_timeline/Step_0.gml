
if (keyboard_check_pressed(vk_add) || keyboard_check_pressed(vk_subtract))
{
    
split_w -= keyboard_check_pressed(vk_add) - keyboard_check_pressed(vk_subtract);
// split_h = 4;

split_w = clamp(split_w,line_w_min_amount,line_w_max_amount);

line_amount_w = (sprite_width - 1) / split_w;
// line_amount_h = (sprite_height - 1) / split_h;
}