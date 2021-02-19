if (button_check_confirm_pressed()) {
	if (instance_exists(obj_Player) && !obj_Game.pause) {
		if (position_meeting(obj_Player.facingX, obj_Player.facingY, id)) {
			if (is_array(msg)) {
				for (var i = 0; i < array_length(msg); i++) {
					eq(new eq_textbox(msg[i], vc_Default));
				}
			} else {
				eq(new eq_textbox(msg, vc_Default));
			}
		}
	}
}
