draw_self();
//draw_line(start_point,y,end_point,y);


///debug

draw_rectangle(real(object_x),real(object_y),real(object_x) + 10, real(object_y) + 10,false);

draw_set_color(c_white);



var end_x = real(object_x) + lengthdir_x(50, real(object_rotation)) + 5;
var end_y = real(object_y) + lengthdir_y(50, real(object_rotation)) + 5;

draw_line(real(object_x)  + 5 ,real(object_y)  + 5,end_x, end_y);


