original_x = x;
display_text = true;

margin_x = 30;
line_y = y + 120;
text_y = y + 70;

data = [];

_id = "";
name = "";
description = "";
lenght = "";
diff = "";

last_id_of_button_selected = 4;

loaded_level_data = false;				

instance = instance_find(manager, 0);


if hidden
{
	display_text = false;
	image_alpha = 0;
}