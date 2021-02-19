selection = selection_handler(selection, 0, array_length_1d(menuItems) - 1);

if (button_check_confirm_pressed()) {
	switch (menuItems[selection]) {
		case "Yes":
			with (obj_Game) {
				loading = true;
				obj_UI.hideGUI = false;
				currentHP = maxHP;
				room_goto(ds_map_find_value(saveData, "saved room"));
				save_game();
				gameOver = false;
			}
			break;
		case "No":
		default:
			with (obj_Game) {
				currentHP = maxHP;
				save_game();
			}
			game_restart();
	}
	selection = 0;
	audio_play_sound(snd_Confirm, audioPriority.sfxmed, false);
}
