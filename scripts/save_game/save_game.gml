function save_game(_saveKey) {
	var file = string(SAVE_FILE);

	SAVE_DATA[? "saved room"] = room;
	SAVE_DATA[? "save tile"] = _saveKey;
	SAVE_DATA[? "current hp"] = obj_Game.currentHP;
	SAVE_DATA[? "max hp"] = obj_Game.maxHP;

	//create a copy of the inventory ds_list and convert the item maps to strings
	if (!ds_list_empty(INVENTORY)) {
		var inv = ds_list_create();
		ds_list_copy(inv, INVENTORY);
		for (var i = 0; i < ds_list_size(inv); i++) {
			inv[| i] = ds_map_write(inv[| i]);
		}
		var str = ds_list_write(inv);
		SAVE_DATA[? "inventory"] = str;
		ds_list_destroy(inv);
	}

	ds_map_secure_save(SAVE_DATA, "game" + file + ".sav");
	
	log("Game saved");
}
