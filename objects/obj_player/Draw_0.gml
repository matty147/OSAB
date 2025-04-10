draw_self();

if dash_speed > 1
{
	var length = 1;

	for (var i = 1; i < 10;i++)
	{

			var behind_player_x = x - lengthdir_x(length * 2 * dash_speed * _speed,image_angle);
			var behind_player_y = y - lengthdir_y(length * 2 * dash_speed * _speed,image_angle);

		draw_sprite_ext(spr_player,	0,behind_player_x,behind_player_y,1,1,image_angle,c_white,1);

	}
}
//draw_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_top,true);