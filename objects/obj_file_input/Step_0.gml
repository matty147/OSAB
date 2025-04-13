if pressed_fetch
{
	audio_master_gain(0);
	pressed_fetch = false;
	show_debug_message("\n\n\n\n\n fetching data");
	get = http_get(base_url + "/results");
	show_debug_message("aasa" + string(get));
	if get == -1
	{
		game_end();	
	}
}

if pressed_post
{
	audio_master_gain(0);
	pressed_post = false;
	show_debug_message("posting data");
	var file = get_open_filename("Audio files|*.ogg|All files|*.*", "");
	if (file == -1)
	{
		show_message("No input given.");
		game_end();
	}

	var file_name = filename_name(file);
	var boundary = "------GameMakerBoundary";

	var file_bin = file_bin_open(file, 0);
	var file_size = file_bin_size(file_bin);

	if (file_size == -1) {
	    show_debug_message("no");
	    file_bin_close(file_bin);
	    exit;
	}

	show_debug_message("\n\n\n\n\n Loaded file: " + file);

	var sound_id = audio_create_stream(file);
	//if (sound_id != -1) {
	//    audio_play_sound(sound_id, 1, false);
	//}

	var send_buffer = buffer_create(file_size, buffer_fixed, 1);


	buffer_seek(send_buffer, buffer_seek_start, 0);
	for (var i = 0; i < file_size; i++) {
	    var byte = file_bin_read_byte(file_bin);
	    buffer_write(send_buffer, buffer_u8, byte);
	}
	file_bin_close(file_bin);

	var headers = ds_map_create();
	ds_map_add(headers, "Host", base_url);
	ds_map_add(headers, "User-Agent", "gmuploader");
	ds_map_add(headers, "Content-Type", "application/octet-stream");
	ds_map_add(headers, "Accept", "*/*");

	var request_id = http_request(base_url, "POST", headers, send_buffer);

	buffer_delete(send_buffer);
	ds_map_destroy(headers);
}