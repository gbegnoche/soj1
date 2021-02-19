/// @function button_check_confirm()
function button_check_confirm() {

	return keyboard_check(ord("Z")) ||
		gamepad_button_check(0, gp_face2);


}
