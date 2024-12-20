y = instance.y - instance.sprite_height * instance.numb_of_timelines - sprite_height;

if instance.hide
{
	y = room_height + sprite_height/2;
}

if keyboard_check_pressed(ord("L"))
{
		show_debug_message(time_stamps);

		var last_value = time_stamps[array_length(time_stamps) -1];

		array_insert(time_stamps, 0, last_value);

		array_delete(time_stamps, array_length(time_stamps) -1, 1)

		show_debug_message(time_stamps);
}

if keyboard_check_pressed(ord("K"))
{
		show_debug_message(time_stamps);

		var last_value = time_stamps[0];

		array_insert(time_stamps, array_length(time_stamps), last_value);

		array_delete(time_stamps, 0, 1)

		show_debug_message(time_stamps);
}