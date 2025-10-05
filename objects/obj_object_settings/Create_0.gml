editor_object = noone;

valid_editor_object = editor_object;

_manager = instance_find(manager,0);

display_name = "None";

inp_depth = depth - 1;

//movable customizable object in the playing field to make editing easyer

// create the objects
live_obj = noone;
inp_time = instance_create_depth(x + 25, y + sprite_height * 1/5 + 40,inp_depth,obj_input_field);
inp_name = instance_create_depth(x + 25, y + sprite_height * 1/5 + 70,inp_depth,obj_input_field);
inp_pos_x = instance_create_depth(x + 25, y + sprite_height * 2/5 + 40,inp_depth,obj_input_field);
inp_pos_y = instance_create_depth(x + 25, y + sprite_height * 2/5 + 40,inp_depth,obj_input_field);
inp_size_x = instance_create_depth(x + 25, y + sprite_height * 2/5 + 70,inp_depth,obj_input_field);
inp_size_y = instance_create_depth(x + 25, y + sprite_height * 2/5 + 70,inp_depth,obj_input_field);
inp_angle = instance_create_depth(x + 25, y + sprite_height * 2/5 + 100,inp_depth,obj_input_field);

// hide the objects
inp_time.visible = false; 
inp_name.visible = false; 
inp_pos_x.visible = false;
inp_pos_y.visible = false;
inp_size_x.visible = false;
inp_size_y.visible = false;
inp_angle.visible = false;

// set their x position
inp_time.x = 90; 
inp_name.x = 90; 
inp_pos_x.x = 135;
inp_pos_y.x = 230;
inp_size_x.x = 135;
inp_size_y.x = 230;
inp_angle.x = 135;

// set their char lenghts
inp_time.max_text_lenght = 5; 
inp_name.max_text_lenght = 25; 
inp_pos_x.max_text_lenght = 4;
inp_pos_y.max_text_lenght = 4;
inp_size_x.max_text_lenght = 3;
inp_size_y.max_text_lenght = 3;
inp_angle.max_text_lenght = 3;

// fix the output to only accept numbers
inp_time.only_numbers = true; 
inp_name.only_numbers = false; 
inp_pos_x.only_numbers = true;
inp_pos_y.only_numbers = true;
inp_size_x.only_numbers = true;
inp_size_y.only_numbers = true;
inp_angle.only_numbers = true;

//
inp_time.image_xscale = 1; 
inp_name.image_xscale = 1; 
inp_pos_x.image_xscale = 1;
inp_pos_y.image_xscale = 1;
inp_size_x.image_xscale = 1;
inp_size_y.image_xscale = 1;
inp_angle.image_xscale = 1;
