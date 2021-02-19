enum PlayerState {
	idle,
	run,
	attack,
	combo
}

if (PAUSE) {
	image_speed = 1;
	player_facing_switch(
		function() {},
		function() {},
		function() {},
		function() {sprite_index = spr_PlayerIdleDown}
	)
	exit;
}

//print_player_state();

// handle sprite
player_state_switch(
 	function() { // Idle
		image_speed = 1;
		player_facing_switch(
			function() {},
			function() {},
			function() {},
			function() {sprite_index = spr_PlayerIdleDown}
		)
	},
	function() { // Run
		image_speed = 1;
		player_facing_switch(
			function() {sprite_index = spr_PlayerRunLeft},
			function() {sprite_index = spr_PlayerRunRight},
			function() {},
			function() {}
		)
	},
	function() { // attack
		
	},
	function() { // combo
		
	});

// handle controls
player_state_switch(
	function() { // Idle
		if (button_check_right()
			^^ button_check_left()
			^^ button_check_up()
			^^ button_check_down()) {
			state = PlayerState.run;
		}
	},
	function() { // Run
		var dx = button_check_right() - button_check_left();
		var dy = button_check_down() - button_check_up();
		if ((dx != 0) || (dy != 0)) {
			var l = sqrt(dx * dx + dy * dy);
			dx /= l;
			dy /= l;
		} else {
			state = PlayerState.idle;
		}
	
		dx *= walkSpeed;
		dy *= walkSpeed;

		y += dy;
	
		if (dy > 0) { // Moving down
			facing = dir.down;
		
			var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom) & tile_index_mask;
			var t2 = tilemap_get_at_pixel(tilemap, x, bbox_bottom) & tile_index_mask;
			var t3 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom) & tile_index_mask;
		
			if (t1 != 0 || t2 != 0) {
				y = ((bbox_bottom & ~7) - 1) - spriteBBoxBottom;
			}
			
			var c1 = instance_position(bbox_left, bbox_bottom, obj_Collision);
			var c2 = instance_position(x, bbox_bottom, obj_Collision);
			var c3 = instance_position(bbox_right, bbox_bottom, obj_Collision);
			
			if (c1 != noone) {
				y = c1.bbox_top - (bbox_bottom - y);
			} else if (c2 != noone) {
				y = c2.bbox_top - (bbox_bottom - y);
			} else if (c3 != noone) {
				y = c3.bbox_top - (bbox_bottom - y);
			}
		} else if (dy < 0) { // Moving up
			facing = dir.up;

			var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_top) & tile_index_mask;
			var t2 = tilemap_get_at_pixel(tilemap, x, bbox_top) & tile_index_mask;
			var t3 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_top) & tile_index_mask;
		
			if (t1 != 0 || t2 != 0) {
				y = ((bbox_top + 8) & ~7) - spriteBBoxTop;
			}
			
			var c1 = instance_position(bbox_left, bbox_top, obj_Collision);
			var c2 = instance_position(x, bbox_top, obj_Collision);
			var c3 = instance_position(bbox_right, bbox_top, obj_Collision);
			
			if (c1 != noone) {
				y = c1.bbox_bottom + (y - bbox_top);
			} else if (c2 != noone) {
				y = c2.bbox_bottom + (y - bbox_top);
			} else if (c3 != noone) {
				y = c3.bbox_bottom + (y - bbox_top);
			}
		}
	
		x += dx;
	
		if (dx > 0) { // Moving right
			facing = dir.right;
		
			var t1 = (tilemap_get_at_pixel(tilemap, bbox_right + collisionXOffset, bbox_top) & tile_index_mask);
			var t2 = (tilemap_get_at_pixel(tilemap, bbox_right + collisionXOffset, bbox_top + 8) & tile_index_mask);
			var t3 = (tilemap_get_at_pixel(tilemap, bbox_right + collisionXOffset, bbox_bottom) & tile_index_mask);
		
			if (t1 != 0 || t2 != 0 || t3 != 0) {
				x = ((bbox_right + collisionXOffset & ~7) - 1) - spriteBBoxRight;
			}
			
			var c1 = instance_position(bbox_right + collisionXOffset, bbox_bottom, obj_Collision);
			var c2 = instance_position(bbox_right + collisionXOffset, bbox_top + 8, obj_Collision);
			var c3 = instance_position(bbox_right + collisionXOffset, bbox_bottom, obj_Collision);
			
			if (c1 != noone) {
				x = c1.bbox_left - (bbox_right - x) - collisionXOffset;
			} else if (c2 != noone) {
				x = c2.bbox_left - (bbox_right - x) - collisionXOffset;
			} else if (c3 != noone) {
				x = c3.bbox_left - (bbox_right - x) - collisionXOffset;
			}
		} else if (dx < 0) { // Moving left
			facing = dir.left;
		
			var t1 = (tilemap_get_at_pixel(tilemap, bbox_left - collisionXOffset, bbox_top) & tile_index_mask);
			var t2 = (tilemap_get_at_pixel(tilemap, bbox_left - collisionXOffset, bbox_top + 8) & tile_index_mask);
			var t3 = (tilemap_get_at_pixel(tilemap, bbox_left - collisionXOffset, bbox_bottom) & tile_index_mask);
		
			if (t1 != 0 || t2 != 0 || t3 != 0) {
				x = ((bbox_left - collisionXOffset + 8) & ~7) - spriteBBoxLeft;
			}
			
			var c1 = instance_position(bbox_left - collisionXOffset, bbox_top, obj_Collision);
			var c2 = instance_position(bbox_left - collisionXOffset, bbox_top + 8, obj_Collision);
			var c3 = instance_position(bbox_left - collisionXOffset, bbox_bottom, obj_Collision);
			
			if (c1 != noone) {
				x = c1.bbox_right + (x - bbox_left) + collisionXOffset;
			} else if (c2 != noone) {
				x = c2.bbox_right + (x - bbox_left) + collisionXOffset;
			} else if (c3 != noone) {
				x = c3.bbox_right + (x - bbox_left) + collisionXOffset;
			}
		}
	},
	function() { // Attack
	
	},
	function() { // Combo
	
	}
);

switch(facing) {
	case dir.right: facingX = x + 10; facingY = y; break;
	case dir.left: facingX = x - 11; facingY = y; break;
	case dir.up: facingX = x; facingY = y - 12; break;
	case dir.down: facingX = x; facingY = y + 12; break
}
