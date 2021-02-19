/// @function button_check_left_pressed()
function button_check_left_pressed() {

	return keyboard_check_pressed(vk_left) ||
		gamepad_button_check_pressed(0, gp_padl) ||
		-gamepad_button_check_pressed(0, gp_axislh);



}
