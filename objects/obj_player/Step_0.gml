move_horizontaly = keyboard_check(ord("D")) - keyboard_check(ord("A"));
move_verticaly = keyboard_check(ord("S")) - keyboard_check(ord("W"));

move_horizontaly = keyboard_check(ord("D")) - keyboard_check(ord("A"));
move_verticaly = keyboard_check(ord("S")) - keyboard_check(ord("W"));

if (move_horizontaly != 0 || move_verticaly != 0) {
    var length = sqrt(sqr(move_horizontaly) + sqr(move_verticaly));
    move_horizontaly /= length;
    move_verticaly /= length;
}

if(y + move_verticaly * _speed - 18 <= 0 || y + move_verticaly * _speed + 18 >= room_height || y + move_verticaly * dash - 18 <= 0 || y + move_verticaly * dash + 18 >= room_height){
    move_verticaly = 0
}
if(x + move_horizontaly * _speed - 18 < 0 || x + move_horizontaly * _speed + 18 > room_width || x + move_horizontaly * dash - 18 < 0 || x + move_horizontaly * dash + 18 > room_width){
    move_horizontaly = 0;
}

x += move_horizontaly * _speed;
y += move_verticaly * _speed;

if(keyboard_check(vk_shift) && cooldown <= 0){
    x += move_horizontaly * dash;
    y += move_verticaly * dash;
    dash_time--
}
else cooldown--

if (dash_time <= 0){
    dash_time = 10;
    cooldown = 20;
}



