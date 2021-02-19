/// @function button_check_confirm_pressed()
function button_check_confirm_pressed() {
	return keyboard_check_pressed(ord("Z")) ||
		gamepad_button_check_pressed(0, gp_face2);
}
