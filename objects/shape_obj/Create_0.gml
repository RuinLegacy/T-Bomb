var shapes = [
    // Square shape
    [
        [[0, 0], [25, 0], [0, 25], [25, 25]],  
        [[0, 0], [25, 0], [0, 25], [25, 25]],  
        [[0, 0], [25, 0], [0, 25], [25, 25]], 
        [[0, 0], [25, 0], [0, 25], [25, 25]] 
    ],
    
    // Line shape
    [
        [[0, 0], [-25, 0], [-50, 0], [25, 0]],
        [[0, 0], [0, -25], [0, -50], [0, 25]], 
        [[0, 0], [-25, 0], [-50, 0], [25, 0]],  
        [[0, 0], [0, -25], [0, -50], [0, 25]]  
    ],
    
    // T-shape
    [
        [[0, -25], [-25, 0], [0, 0], [25, 0]],  
        [[0, 0], [0, -25], [0, 25], [25, 0]],     
        [[0, 25], [-25, 0], [0, 0], [25, 0]],     
        [[0, 0], [-25, 0], [0, -25], [0, 25]]   
    ],
    
    // L-shape
    [
        [[-25, 0], [0, 0], [25, 0], [25, -25]], 
        [[0, -25], [0, 0], [0, 25], [25, 25]],  
        [[-25, 0], [0, 0], [25, 0], [-25, 25]], 
        [[0, -25], [0, 0], [0, 25], [-25, -25]]   
    ],
    
    // Reverse L-shape
    [
        [[25, 0], [0, 0], [-25, 0], [-25, -25]], 
        [[0, -25], [0, 0], [0, 25], [-25, 25]],  
        [[25, 0], [0, 0], [-25, 0], [25, 25]],  
        [[0, -25], [0, 0], [0, 25], [25, -25]]   
    ],
    
    // Z-shape
    [
        [[-25, 0], [0, 0], [0, 25], [25, 25]],   
        [[0, 25], [0, 0], [25, 0], [25, -25]],    
        [[-25, 0], [0, 0], [0, 25], [25, 25]],   
        [[0, 25], [0, 0], [25, 0], [25, -25]]   
 
    ],
    
    // Reverse Z-shape
    [
        [[25, 0], [0, 0], [0, 25], [-25, 25]],   
        [[0, 25], [0, 0], [-25, 0], [-25, -25]],  
        [[25, 0], [0, 0], [0, 25], [-25, 25]],  
        [[0, 25], [0, 0], [-25, 0], [-25, -25]] 
    ]
];


selected_shape =global.next_shape;

global.next_shape =  irandom(array_length(shapes) - 1);

block_color = selected_shape + 1;
rotation_state = 0;

rotation_positions = shapes[selected_shape];

block1 = instance_create_layer(x + rotation_positions[rotation_state][0][0], y + rotation_positions[rotation_state][0][1], "Instances", block_moving_obj);
block1.image_index = block_color;

block2 = instance_create_layer(x + rotation_positions[rotation_state][1][0], y + rotation_positions[rotation_state][1][1], "Instances", block_moving_obj);
block2.image_index = block_color;

block3 = instance_create_layer(x + rotation_positions[rotation_state][2][0], y + rotation_positions[rotation_state][2][1], "Instances", block_moving_obj);
block3.image_index = block_color;

block4 = instance_create_layer(x + rotation_positions[rotation_state][3][0], y + rotation_positions[rotation_state][3][1], "Instances", block_moving_obj);
block4.image_index = block_color;

blocks_arr = [block1, block2, block3, block4];

drop_it = false;
allow_movement = true

game_over = false
collision_check = false
allow_horizontal = true;

grace_timer = 1; 
has_collided = false;

function check_and_clear_rows() {
    global.rows_cleared = [];
    global.total_rows_cleared = 0;

    for (var row = global.grid_height - 1; row >= 0; row--) {
        global.row_y = global.grid_start_y + (row * global.block_size);
        var blocks_in_row = 0;

        with (block_still_obj) {
            if (y == global.row_y) {
                blocks_in_row++;
            }
        }

        if (blocks_in_row == global.grid_width) {
            global.rows_cleared[array_length(global.rows_cleared)] = global.row_y;
            global.total_rows_cleared++;
        }
    }

    if (array_length(global.rows_cleared) > 0) {
        global.animation_timer = 30;

        for (var i = 0; i < array_length(global.rows_cleared); i++) {
            global.row_y = global.rows_cleared[i];

            instance_create_layer(global.grid_start_x, global.row_y, "Instances", animation_obj);

            with (block_still_obj) {
                if (y == global.row_y) {
					global.score += 10
                    instance_destroy();
                }
            }
        }

        global.shift_rows_pending = true;
        global.rows_to_shift = global.rows_cleared;
    }
}