/// @function button_check_cancel_pressed()
function button_check_cancel_pressed() {

	return keyboard_check_pressed(ord("X")) ||
		gamepad_button_check_pressed(0, gp_face1);


}
