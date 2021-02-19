/// @function button_check_cancel()
function button_check_cancel() {

	return keyboard_check(ord("X")) ||
		gamepad_button_check(0, gp_face1);


}
