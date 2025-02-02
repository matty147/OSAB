draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(c_white);
var _time = (timeline_time.offset / timeline_time.distance);
var minutes = floor((_time * 5) / 60);
var seconds = abs((_time * 5) % 60);
seconds = (seconds < 10) ? "0" + string(seconds) : string(seconds);

draw_text_transformed(x + 10,y + sprite_height / 2,"time: " + string(minutes) + ":" + string(seconds),1.5,1.5,0);