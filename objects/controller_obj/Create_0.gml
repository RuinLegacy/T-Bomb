randomize()

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

// globals

// drop
global.drop_timer = 20;
global.drop_delay = 20;
global.drop_distance = 25;

global.score = 0;


// switch blocks
global.blocks_spawned = false;
global.switch_blocks = false;

// find grid
global.grid_width = 10;
global.block_size = 25; 
global.grid_start_x = 25; 
global.grid_start_y = 150;

// animate change
global.animation_timer = 0;
global.cleared_row_y = -1; 
global.rows_cleared = [];
global.shift_rows_pending = false; 
global.rows_to_shift = []; 
global.grid_height = 20;
global.total_rows_cleared = 0;

// Counter
global.counter = 25;

//Next Shape
global.next_shape =  irandom(array_length(shapes) - 1);

