/// @description If on path, set sprite
if (path_index >= 0) {
	var angle = round(direction);
	if (x != xprevious || y != yprevious) {
		if ((angle <= 45 || angle > 315)) {
			sprite_index = walkRight;
		} else if (angle > 45 && angle <= 135) {
			sprite_index = walkUp;
		}else if (angle > 135 && angle <= 225) {
			sprite_index = walkLeft;
		} else if ((angle > 225 && angle <= 315)) {
			sprite_index = walkUp;
		}
	} else {
		if ((angle <= 45 || angle > 315)) {
			sprite_index = right;
		} else if (angle > 45 && angle <= 135) {
			sprite_index = up;
		}else if (angle > 135 && angle <= 225) {
			sprite_index = left;
		} else if ((angle > 225 && angle <= 315)) {
			sprite_index = down;
		}
	}
}
