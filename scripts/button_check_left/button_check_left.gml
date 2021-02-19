/// @function button_check_left()
function button_check_left() {

	return keyboard_check(vk_left) ||
		gamepad_button_check(0, gp_padl) ||
		-gamepad_button_check(0, gp_axislh);
}
