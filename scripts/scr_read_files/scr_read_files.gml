
function scr_read_files(folder, extension, results) {
	
	show_debug_message("Searching folder: " + folder); // Debugging path
	
	if (!directory_exists(working_directory + folder + "\\")) {
		show_debug_message("Folder does not exist: " + folder);
		show_debug_message(working_directory);
    return;
	}

    var subfolders = ds_list_create();
    var path = folder + "\\*";
    var _file = file_find_first(path,  fa_directory);

    while (_file != "") {
        var full_path = folder + "\\" + _file;
        if (_file != "." && _file != "..") {
            if (directory_exists(full_path)) {
                ds_list_add(subfolders, full_path);
            } else if (file_exists(full_path) && string_pos(extension, _file) > 0) {
                ds_list_add(results, full_path);
            }
        }

        _file = file_find_next();
    }

    file_find_close();

    for (var i = 0; i < ds_list_size(subfolders); i++) {
        var subfolder = subfolders[| i];
        scr_read_files(subfolder, extension, results);
    }

    ds_list_destroy(subfolders);
}
