/// @function inventory_add_item(name,key1,value1,key2,value2,etc)
/// @description Add an item to the player's inventory with the given attributes
/// @param name Name of the item to add
function inventory_add_item() {

	var name = argument[0];
	var inv = INVENTORY;

	for (var i = 0; i < ds_list_size(inv); i++) {
		var val = ds_list_find_value(inv, i);
	
		if (ds_map_find_value(val, "name") == name) {
			ds_map_set(val, "quantity", ds_map_find_value(val, "quantity") + 1);
			return;
		}
	}

	var item = ds_map_create();

	ds_map_add(item, "name", name);
	ds_map_add(item, "quantity", 1);
	for (var j = 1; j < argument_count; j += 2) {
		ds_map_add(item, argument[j], argument[j + 1]);
	}

	ds_list_add(inv, item);



}
