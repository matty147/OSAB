original_x = x;
display_text = true;

display_image = "";
sound_id = NaN;
audio_deleted = 0;

picture_scale_x = 1;
picture_scale_y = 1;

margin_x = 30;
line_y = y + 120;
text_y = y + 70;

data = [];

_id = "";
name = "";
description = "";
lenght = "";
diff = "";

text = "";
text_size = 1;

last_id_of_button_selected = 4;

loaded_level_data = false;				

instance = instance_find(manager, 0);

default_yscale = image_yscale;
needeed_scale = default_yscale;

if hidden
{
	display_text = false;
	image_alpha = 0;
}