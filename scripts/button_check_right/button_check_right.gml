/// @function button_check_right()
function button_check_right() {

	return keyboard_check(vk_right) ||
		gamepad_button_check(0, gp_padr) ||
		gamepad_button_check(0, gp_axislh);



}
