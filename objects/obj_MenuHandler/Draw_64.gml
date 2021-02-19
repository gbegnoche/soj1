if (!ds_list_empty(menuList)) {
	for (var i = 0; i < ds_list_size(menuList); i++) {
		if (i == ds_list_size(menuList) - 1 || menuList[| i].persist) {
			menuList[| i].draw_gui();
		}
	}
}
