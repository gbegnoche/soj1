function new_game(_fileNumber, _name) {
	eq([
		new eq_screen_fade_out(fadeSpeed.slow),
		new eq_menu_list_remove_all(),
		new eq_room_goto(rm_Main),
		new eq_screen_fade_in(fadeSpeed.vslow),
	]);
}