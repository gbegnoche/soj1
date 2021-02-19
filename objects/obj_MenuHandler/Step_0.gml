 if (!ds_list_empty(menuList)) {
	PAUSE;
	var lastIndex = ds_list_size(menuList) - 1;
	var activeMenu = ds_list_find_value(menuList, lastIndex);
	
	if (ds_queue_empty(EVENT_QUEUE)) {
		activeMenu.step();
	}
}
