var file = get_open_filename("MP3 soubory|*.mp3|Všechny soubory|*.*", "");
if (file == "") exit;
if (file == -1) exit;

var file_name = filename_name(file);
var boundary = "------GameMakerBoundary";

var file_bin = file_bin_open(file, 0);
var file_size = file_bin_size(file_bin);

if (file_size <= 0) {
    show_debug_message("nic");
    file_bin_close(file_bin);
    exit;
}


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
