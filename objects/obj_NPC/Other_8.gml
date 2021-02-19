/// @description Set sprite to idle
if ((direction <= 45 || direction > 315)) {
	facing = dir.right;
} else if (direction > 45 && direction <= 135) {
	facing = dir.up;
}else if (direction > 135 && direction <= 225) {
	facing = dir.left;
} else if ((direction > 225 && direction <= 315)) {
	facing = dir.down;
}
