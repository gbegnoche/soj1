/// @function button_check_start_pressed()
function button_check_start_pressed() {

	return keyboard_check_pressed(vk_enter) ||
		gamepad_button_check_pressed(0, gp_start);



}
