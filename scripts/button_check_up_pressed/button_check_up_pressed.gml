/// @function button_check_up_pressed()
function button_check_up_pressed() {

	return keyboard_check_pressed(vk_up) ||
		gamepad_button_check_pressed(0, gp_padu) ||
		-gamepad_button_check_pressed(0, gp_axislv);



}
