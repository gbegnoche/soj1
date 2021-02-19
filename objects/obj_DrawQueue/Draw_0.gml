with(obj_BaseRender) {
	ds_priority_add(other.drawQueue, id, y);
}

while(!ds_priority_empty(drawQueue)) {
	with(ds_priority_delete_min(drawQueue)) {
		// Code to draw goes here
		//if (object_get_name(object_index) == "obj_Player" && invincible) {
		//	image_alpha = 0.5;
		//}
		//if (drawShadow) {
		//	draw_sprite(spr_SmallShadow, 0, x, bbox_bottom + 1);
		//}
		draw_self();
		//image_alpha = 1;
	}
}