/// @description Create key and Player if loading
if (!instance_exists(obj_Player) && ds_map_find_value(obj_Game.saveData, "save tile") == key && obj_Game.loading) {
	instance_create_layer(x + ((bbox_right - x) / 2), y + ((bbox_bottom - y) / 2), "il_Actors", obj_Player);
	obj_Game.loading = false;
}
