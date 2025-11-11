enum CUR_EDITING
{
	NONE,
	OBJECT,
	OPTIONS, // add subctg?
	LEVEL_META
}

state = CUR_EDITING.NONE;

editor_object = noone;

valid_editor_object = editor_object;

_manager = instance_find(manager,0);

inp_depth = depth - 1;

//movable customizable object in the playing field to make editing easyer

inp_objects_settings = [
//   return_key,  x,    y,                            leng, numb, xscale, parent
	["time",   x + 90,  y + sprite_height * 1/15 + 40,  5,  true,  1, id],	
	["name",   x + 90,  y + sprite_height * 1/15 + 70,  25, false, 3.2, id],	
	["pos_x",  x + 135, y + sprite_height * 1/3 +  40,  4,  true,  1, id],	
	["pos_x",  x + 230, y + sprite_height * 1/3 +  40,  4,  true,  1, id],
	["size_x", x + 135, y + sprite_height * 1/3 +  70,  3,  true,  1, id],	
	["size_y", x + 230, y + sprite_height * 1/3 +  70,  3,  true,  1, id],	
	["angle",  x + 135, y + sprite_height * 1/3 +  100, 3,  true,  1, id]	
];

objects = [];

live_obj = noone;
for (var o = 0; o < array_length(inp_objects_settings); o++)
{
	var obj_data = inp_objects_settings[o];
	var obj = instance_create_depth(obj_data[1],obj_data[2],inp_depth,obj_input_field);
	obj.visible = false;
	obj.image_xscale = obj_data[5];
	obj.max_text_lenght = obj_data[3];
	obj.only_numbers = obj_data[4];
	obj._parent = obj_data[6];
	obj.return_key = obj_data[0];
	obj.image_yscale = 0.9;

	objects[o] = obj;
}

// creating object for meta editing
inp_meta_data = [
	["meta_id",   x + 100,  y + sprite_height * 1/15 + 40,  9, true,  1.3, id], // do we want user to be able and edit ids?
	["meta_name", x + 100,  y + sprite_height * 1/15 + 70,  25, false, 2.75, id],
	["meta_desc", x + 100,  y + sprite_height * 1/15 + 100, 25, false, 2.75, id],
	["meta_leng", x + 100,  y + sprite_height * 1/15 + 130, 5, true,  1, id],	
	["meta_diff", x + 100,  y + sprite_height * 1/15 + 160, 5, true,  1, id]	
];

metas = [];

for (var o = 0; o < array_length(inp_meta_data); o++)
{
	var meta_obj = inp_meta_data[o];
	var obj = instance_create_depth(meta_obj[1],meta_obj[2],inp_depth,obj_input_field);
	obj.visible = false;
	obj.image_xscale = meta_obj[5];
	obj.max_text_lenght = meta_obj[3];
	obj.only_numbers = meta_obj[4];
	obj._parent = meta_obj[6];
	obj.return_key = meta_obj[0];
	obj.image_yscale = 0.9;

	
	metas[o] = obj;
		
}

set_data = [];

show_debug_message($"objs: {array_length(objects)} meta: {array_length(metas)}");