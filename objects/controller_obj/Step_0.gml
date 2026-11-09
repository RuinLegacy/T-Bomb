if global.animation_timer > 0 {
    global.animation_timer--; 
    return; 
}

if global.shift_rows_pending {
	
    for (var i = 0; i < array_length(global.rows_to_shift); i++) {
        global.row_y = global.rows_to_shift[i]; 

        with (block_still_obj) {
            if (y < global.row_y) {
                y += global.total_rows_cleared * global.block_size; 
            }
        }
    }

    global.shift_rows_pending = false;
    global.rows_to_shift = [];
    global.total_rows_cleared = 0; 
}


if global.drop_timer > 0 {
    global.drop_timer--;
} else {
    if global.blocks_spawned == true {
        global.drop_timer = global.drop_delay;
    } else {

        instance_create_layer(150, 150, "Instances", shape_obj);
        global.blocks_spawned = true;
        global.drop_timer = global.drop_delay;
    }
}

if !instance_exists(next_shape_obj){

	instance_create_layer(325,425,"Instances", next_shape_obj)

}