mainMenu = [
	new option(
		"New",
		function() {
			new_game()
		}
	),
	new option(
		"Quit",
		function() {
			game_end();
		}
	)
];

menu_list_add(
	new menu_ext(
		SCREEN_CENTER_X,
		SCREEN_CENTER_Y + 20,
		mainMenu,
		align.center,
		false,
		40,
		false
	)
);

obj_UI.hideGUI = true;
