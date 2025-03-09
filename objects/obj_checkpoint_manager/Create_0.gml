checkpoint_list = [];
checkpoints_numb = instance_number(obj_checkpoint);
current_level = global.cleared_levels;


for (var i = 0; i < checkpoints_numb; ++i) {
    array_push(checkpoint_list,instance_find(obj_checkpoint,i));
}


//show_debug_message(checkpoint_list);