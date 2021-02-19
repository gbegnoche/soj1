/// @function button_check_down()
function button_check_down() {

	return keyboard_check(vk_down) ||
		gamepad_button_check(0, gp_padd) ||
		gamepad_button_check(0, gp_axislv);
}
