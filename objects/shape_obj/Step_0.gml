allow_horizontal = true;

if global.drop_timer <= 0 || drop_it {

	allow_horizontal = false;

	var _can_drop = true;

	for(var _i = 0; _i < array_length(blocks_arr); _i++){
	if collision_rectangle(blocks_arr[_i].x, blocks_arr[_i].y + global.drop_distance,
		blocks_arr[_i].x + 25, blocks_arr[_i].y + global.drop_distance + 25,
		block_still_obj, false, false) || 
		collision_rectangle(blocks_arr[_i].x, blocks_arr[_i].y + global.drop_distance,
		blocks_arr[_i].x + 25, blocks_arr[_i].y + global.drop_distance + 25, 
		border_bottom_obj, false, false){
	
			_can_drop = false;
			break;
			}
	
		}
		
		if _can_drop{
		
			y+= global.drop_distance;
			for (var _i = 0; _i < array_length(blocks_arr); _i++){
				blocks_arr[_i].y += global.drop_distance;
			
			}
		}else{
			
			if!has_collided {
				
				has_collided = true;
				grace_timer = 1;
			
			}
		
		}
		
		drop_it = false;	
}
	if has_collided{
	
	grace_timer--;
	if grace_timer <= 0 {
		global.switch_blocks = true;
		
		for (var _i = 0; _i < array_length(blocks_arr); _i++ ){
		
			var new_block = instance_create_layer(blocks_arr[_i].x, blocks_arr[_i].y, "Instances", block_still_obj);
			new_block.image_index = blocks_arr[_i].image_index;
			instance_destroy(blocks_arr[_i]);
	
		}
			
			global.blocks_spawned = false;
			global.switch_blocks = false;
			
			
			check_and_clear_rows();
			
			if(global.total_rows_cleared == 0){
			global.counter--
			}
			
			if(global.total_rows_cleared == 1){
			//Do nothing
			}

			if(global.total_rows_cleared >= 2){
			global.counter += (global.total_rows_cleared - 1);
			}
			if(global.counter <= 0){
			room_restart();
			}
			
			instance_destroy();
	
	}
	
}

if allow_horizontal && !has_collided{

	//Move Left
	if keyboard_check_pressed(vk_left){
	
	x -= 25;
	
	for(var _i = 0; _i < array_length(blocks_arr); _i++){
	
		blocks_arr[_i].x -= 25;
	
		}
		
		var _collision_check = false;
		for(var _i = 0; _i < array_length(blocks_arr); _i++){
		
		if(blocks_arr[_i].x < global.grid_start_x
    || collision_rectangle(blocks_arr[_i].x, blocks_arr[_i].y,
                           blocks_arr[_i].x + 25, blocks_arr[_i].y + 25,
                           block_still_obj, false, false)){
		
			collision_check = true;
			break;
			}
			
		}
		
		if collision_check{
		
		x += 25;
		for(var _i = 0; _i < array_length(blocks_arr); _i++){
			
			blocks_arr[_i].x += 25;
			
			}
		
		}
		
	}
	
	//Move Right
	if keyboard_check_pressed(vk_right){
	
	x += 25;
	
	for(var _i = 0; _i < array_length(blocks_arr); _i++){
	
		blocks_arr[_i].x += 25;
	
		}
		
		var _collision_check = false;
		for(var _i = 0; _i < array_length(blocks_arr); _i++){
		
		if(blocks_arr[_i].x > global.grid_start_x + (global.grid_width * global.block_size) - 1
    || collision_rectangle(blocks_arr[_i].x, blocks_arr[_i].y,
                           blocks_arr[_i].x + 25, blocks_arr[_i].y + 25,
                           block_still_obj, false, false)){
		
			collision_check = true;
			break;
			}
			
		}
		
		if collision_check{
		
		x -= 25;
		for(var _i = 0; _i < array_length(blocks_arr); _i++){
			
			blocks_arr[_i].x -= 25;
			
			}
		
		}
		
	}

}

if keyboard_check_pressed(vk_down){
	
	global.drop_timer = 0;
	drop_it = true;

}

//Rotate on up press
if allow_horizontal && !has_collided && keyboard_check_pressed(vk_up){

	var _next_rotation_state = (rotation_state + 1) mod 4;
	var _valid_rotation = true;

	for(var _i = 0; _i < array_length(blocks_arr); _i++){
	
		var _new_x = x + rotation_positions[_next_rotation_state][_i][0];
		var _new_y = y + rotation_positions[_next_rotation_state][_i][1];
		
		if _new_x < global.grid_start_x || _new_x > global.grid_start_x + (global.grid_width * global.block_size) - 1 
		|| collision_rectangle(_new_x, _new_y, _new_x + 25, _new_y + 25, block_still_obj, false, false) {
		
		_valid_rotation = false;
		break;
		
		}
	}
	
	if _valid_rotation {
	
	rotation_state = _next_rotation_state;
	for(var _i = 0; _i < array_length(blocks_arr); _i++){
	
		blocks_arr[_i].x = x + rotation_positions[rotation_state][_i][0];
		blocks_arr[_i].y = y + rotation_positions[rotation_state][_i][1];
	
		}
	
	}
	
}