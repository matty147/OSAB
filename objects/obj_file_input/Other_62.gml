show_debug_message("ID v async_load: " + string(ds_map_find_value(async_load, "id")));
show_debug_message("Hledané ID: " + string(get));

var status = ds_map_find_value(async_load, "status");
show_debug_message("Status: " + string(status));

if (status == 0) {
    var result = ds_map_find_value(async_load, "result");

    var response_start = string_pos("\"response\":", result);
    if (response_start > 0) {
        result = string_copy(result, response_start + 11, string_length(result) - response_start - 11);
        
        result = string_replace_all(result, "\"", "");

        if (string_pos(" ", result) == 1) {
            result = string_copy(result, 2, string_length(result) - 1);
        }

        if (string_char_at(result, string_length(result)) == "}") {
            result = string_copy(result, 1, string_length(result) - 1);
        }

        result = string_replace_all(result, "\\n", "\n");

        if (string_copy(result, 1, 3) == "```" && string_copy(result, string_length(result) - 2, 3) == "```") {
            result = string_copy(result, 4, string_length(result) - 6);
        }
    }

    var header = "id,0\nname,AI level\ndescription,AI generated level\nlenght,69\ndiff,6\n-\n";
    result = header + result;

    show_debug_message("Výsledek:\n" + result);

    // Kontrola, zda výstup nezačíná na error
    if (string_copy(result, string_length(header) + 1, 6) != "error:") {
        var file_path = get_save_filename("Osab soubor|*.osab", "level.osab");
        if (file_path != "") {
            var file = file_text_open_write(file_path);
            if (file != -1) {
                file_text_write_string(file, result);
                file_text_close(file);
                show_debug_message("Soubor uložen: " + file_path);
            } else {
                show_debug_message("Chyba při ukládání souboru!");
            }
        } else {
            show_debug_message("Uživatel zrušil ukládání!");
        }
    } else {
        show_debug_message("Výsledek obsahuje chybu – neukládám soubor.");
    }
} else {
    show_debug_message("Požadavek selhal. Status: " + string(status));
}
