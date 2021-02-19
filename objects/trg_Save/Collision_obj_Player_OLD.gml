if (!saved) {
	ds_map_replace(obj_Game.saveData, "saved room", room);
	ds_map_replace(obj_Game.saveData, "save tile", key);
	save_game();
	saved = true;
	show_debug_message("Game saved");
}
