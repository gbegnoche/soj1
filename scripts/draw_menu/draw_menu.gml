function draw_menu(_x, _y, _options, _selection) {
	var xx = _x;
	var yy = _y;
	var menuItems = _options;
	var select = _selection;

	var xx2 = 0;
	for (var j = 0; j < array_length(menuItems); j++) {
		var w = xx + string_width(menuItems[j]) + 80;
		if (xx2 < w) {
			xx2 = w;
		}
	}
	var h = yy + ((array_length(menuItems) * 40) + 20)
	var yy2 = h;

	draw_text_box_blank(xx, yy, xx2, yy2);

	for (var i = 0; i < array_length(menuItems); i++) {
		if (i == select) {
			draw_set_color(c_yellow);
		}
		var text = menuItems[i];
		draw_text(xx + 20, (yy + 20) + (i * 40), text);
		draw_set_color(c_white);
	}
}