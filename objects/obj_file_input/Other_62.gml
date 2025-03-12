show_debug_message("ID v async_load: " + string(ds_map_find_value(async_load, "id")));
show_debug_message("Hledané ID: " + string(get));

var status = ds_map_find_value(async_load, "status");
show_debug_message("Status: " + string(status));

if (status == 0) {
    var result = ds_map_find_value(async_load, "result");
    show_debug_message("Výsledek: " + string(result));
} else {
    show_debug_message("Požadavek selhal. Status: " + string(status));
}