if (!ds_map_exists(obj_Game.saveData, key)) {
	ds_map_replace(obj_Game.saveData, key, true);
	for (var i = 0; i < array_length(evts); i++) {
		eq(evts[i]);
	}
	eq(new eq_save_game(key));
}
