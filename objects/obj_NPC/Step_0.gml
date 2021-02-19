if (button_check_confirm_pressed()
&& !obj_Game.pause
&& instance_exists(obj_Player)
&& position_meeting(obj_Player.facingX, obj_Player.facingY, id)) {
	// Face the direction of the player if animation exists
	var angle = point_direction(x, y, obj_Player.x, obj_Player.y);
	//TO-DO: Fix - sprite will always point up or down if possible
	if ((angle <= 90 || angle >= 270) && right) {
		facing = dir.right;
	} else if (angle > 90 && left) {
		facing = dir.left;
	}
	if (angle > 225 && down) {
		facing = dir.down;
	} else if ((angle > 45 && angle < 135) && up) {
		facing = dir.up;
	}
}

switch(facing) {
	case dir.down: sprite_index = down; break;
	case dir.up: sprite_index = up; break;
	case dir.right: sprite_index = right; break;
	case dir.left: sprite_index = left; break;
}
