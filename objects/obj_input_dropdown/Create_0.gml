option_text = [
"None",
"Bounce",
"Position",
"Scale"
];

open = false;

option_numbers = array_length(option_text) +1;
button_space = 5;

open = false;
override = false;

inp_menu = noone;

inp_dropdown_text = "None";
update_value = false;

object_settings = instance_find(obj_object_settings,0);