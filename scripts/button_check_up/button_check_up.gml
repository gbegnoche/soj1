/// @function button_check_up()
function button_check_up() {

	return keyboard_check(vk_up) ||
		gamepad_button_check(0, gp_padu) ||
		-gamepad_button_check(0, gp_axislv);
}
