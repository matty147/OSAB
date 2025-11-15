split_w = 25;
split_h = 4;

line_amount_w = (sprite_width - 1) / split_w;
line_amount_h = (sprite_height - 1) / split_h;

line_w_min_amount = 6;
line_w_max_amount = 40;

line_color = c_gray;

line_width = 1;

time = 0;

tick =	10;
show_debug_message($"line_amount: {line_amount_h},{line_amount_w}");

timeline_offset = 0; // seconds?