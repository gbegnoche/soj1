function load_game(_fileNumber) {
	with (obj_Game) {
		loading = true;
		ds_map_destroy(saveData);
		saveData = ds_map_secure_load("game" + string(_fileNumber) + ".sav");
	
		// Load current and max hp
		currentHP = saveData[? "current hp"];
		maxHP = saveData[? "max hp"];
	
		// Load inventory
		if (ds_map_find_value(saveData, "inventory") != "") {
			var inv = ds_list_create();
			ds_list_read(inv, ds_map_find_value(saveData, "inventory"));
			for (var i = 0; i < ds_list_size(inv); i++) {
				var str = inv[| i];
				inv[| i] = ds_map_create();
				ds_map_read(inv[| i], str);
			}
			ds_list_copy(inventory, inv);
			ds_list_destroy(inv);
		}
		eq(new eq_screen_fade_out(fadeSpeed.med));
		eq(new eq_menu_list_remove_all());
		eq(new eq_room_goto(ds_map_find_value(saveData, "saved room")));
		eq(new eq_screen_fade_in(fadeSpeed.med));
	}
}
