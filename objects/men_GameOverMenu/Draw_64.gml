draw_set_font(fnt_Munro);
draw_text_transformed((window_get_width() - string_width(title)) / 3, 160, title, 4, 4, 0);

var msg = "Continue?";

draw_text((window_get_width() - string_width(msg)) / 2, 300, msg);

for (var i = 0; i < array_length_1d(menuItems); i++) {
	if (i == selection) {
		draw_set_color(c_yellow);
	}
	var text = menuItems[i];
	draw_text((window_get_width() - string_width(text)) / 2, 360 + (i * 40), text);
	draw_set_color(c_white);
}
