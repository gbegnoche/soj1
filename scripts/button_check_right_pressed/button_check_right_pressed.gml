/// @function button_check_right_pressed()
function button_check_right_pressed() {

	return keyboard_check_pressed(vk_right) ||
		gamepad_button_check_pressed(0, gp_padr) ||
		gamepad_button_check_pressed(0, gp_axislh);



}
