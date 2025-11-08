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

	
	objects[o] = obj;
		
}

// creating object for meta editing

inp_meta_id = instance_create_depth(x + 25, y + sprite_height * 1/15 + 40,inp_depth,obj_input_field);
inp_meta_name = instance_create_depth(x + 25, y + sprite_height * 1/15 + 40,inp_depth,obj_input_field);
inp_meta_desc = instance_create_depth(x + 25, y + sprite_height * 1/15 + 40,inp_depth,obj_input_field);
inp_meta_leng = instance_create_depth(x + 25, y + sprite_height * 1/15 + 40,inp_depth,obj_input_field);
inp_meta_diff = instance_create_depth(x + 25, y + sprite_height * 1/15 + 40,inp_depth,obj_input_field);

inp_meta_id.visible = false; 
inp_meta_name.visible = false; 
inp_meta_desc.visible = false;
inp_meta_leng.visible = false;
inp_meta_diff.visible = false;

set_data = [];