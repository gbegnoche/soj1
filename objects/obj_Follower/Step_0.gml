if (point_distance(x, y, obj_Player.x, obj_Player.y) > trailingDistance) {
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
} else if (point_distance(x, y, obj_Player.x, obj_Player.y) < (trailingDistance - 10)) {
	speed = 0;
	idle = true;
}

if (!idle) {
	switch (facing) {
		case dir.right:
			sprite_index = walkRight;
			break;
		case dir.left:
			sprite_index = walkLeft;
			break;
		case dir.up:
			sprite_index = walkUp;
			break;
		case dir.down:
			sprite_index = walkDown;
			break;
		default:
			sprite_index = walkDown;
			facing = dir.down;
	}
}
if (idle) {
	switch (facing) {
		case dir.right:
			sprite_index = idleRight;
			break;
		case dir.left:
			sprite_index = idleLeft;
			break;
		case dir.up:
			sprite_index = idleUp;
			break;
		case dir.down:
			sprite_index = idleDown;
			break;
		default:
			sprite_index = idleDown;
			facing = dir.down;
	}
}

