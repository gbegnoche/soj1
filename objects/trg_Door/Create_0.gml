if (!instance_exists(obj_Player) && !obj_Game.loading) {
	if (obj_Game.doorIndex == index) {
		var xx = x + ((bbox_right - x) / 2);
		var yy = y + ((bbox_bottom - y) / 2);
		switch (facingAfter) {
			case dir.up: yy -= 8; break;
			case dir.down: yy -= 5; break;
			case dir.left: xx -= 5; break;
			case dir.right: xx += 5; break;
		}
		var pl = instance_create_layer(xx, yy, "il_Actors", obj_Player);
		pl.facing = facingAfter;
	}
}
