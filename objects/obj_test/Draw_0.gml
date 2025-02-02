draw_self();
//draw_line(start_point,y,end_point,y);

	if !dragging
	{
		if x > instance.x
		{
			draw_sprite_ext(asset_get_index(string(display_image)),0,x + 16,y,0.25,0.25,0,c_white,1);
		}
	}


draw_rectangle(real(object_x),real(object_y),real(object_x) + 10, real(object_y) + 10,false);

draw_set_color(c_white);



var end_x = real(object_x) + lengthdir_x(50, real(object_rotation)) + 5;
var end_y = real(object_y) + lengthdir_y(50, real(object_rotation)) + 5;

draw_line(real(object_x)  + 5 ,real(object_y)  + 5,end_x, end_y);