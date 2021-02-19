/// @function button_check_down_pressed()
function button_check_down_pressed() {

	return keyboard_check_pressed(vk_down) ||
		gamepad_button_check_pressed(0, gp_padd) ||
		gamepad_button_check_pressed(0, gp_axislv);



}
