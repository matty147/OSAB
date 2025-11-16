draw_self();

for (var i = 0;i <= split_w;i++)
{
    draw_line_width_color(x + line_amount_w * i,y,x + line_amount_w * i,y + sprite_height,line_width,line_color,line_color);
    
    draw_text_ext_transformed_color(x + line_amount_w * i,y - 20,$"{(floor(-timeline.timeline_offset) + i)}",1,10,0.75,0.75,0,c_white,c_white,c_white,c_white,1);
}

for (var i = 0;i <= split_h;i++)
{
    draw_line_width_color(x,y + line_amount_h * i,x + sprite_width,y + line_amount_h * i,line_width,line_color,line_color);
}