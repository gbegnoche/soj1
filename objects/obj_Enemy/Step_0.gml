// Pause behavior
if (obj_Game.pause = true || !instance_exists(obj_Player)) {
	speed = 0;
	exit;
}
// Movement
if (!knockedBack) {
	if (point_distance(x, y, obj_Player.x, obj_Player.y) < sightDistance) {
	   move_towards_point(obj_Player.x, obj_Player.y, movementSpeed);
	   if (direction >= 45 && direction < 135) {
			facing = dir.up;
		} else if (direction >= 135 && direction < 225) {
			facing = dir.left;
		} else if (direction >= 225 && direction < 315) {
			facing = dir.down;
		} else {
			facing = dir.right;
		}
		idle = false;
	} else {
		speed = 0;
		idle = true;
	}
}
// Smooth knockback
if (knockedBack) {
	var t1 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_top) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom) & tile_index_mask;
	var t3 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_top) & tile_index_mask;
	var t4 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom) & tile_index_mask;	
	
	if (t1 != 0 || t2 != 0 || t3 != 0 || t4 != 0) {
		speed = 0;
	} else {
		speed = max((speed - 2), 0);
	}
}
// Check health
if (hp <= 0) {
	instance_destroy();
}