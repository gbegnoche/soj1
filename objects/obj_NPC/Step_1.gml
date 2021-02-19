if (button_check_confirm_pressed()
	&& !obj_Game.pause
	&& instance_exists(obj_Player)
	&& position_meeting(obj_Player.facingX, obj_Player.facingY, id)
) {
	if (is_array(msg)) {
		for (var i = 0; i < array_length(msg); i++) {
			eq(new eq_textbox(msg[i], voice));
		}
	} else {
		eq(new eq_textbox(msg, voice));
	}
}