/// @function draw_text_box_blank(x1,y1,x2,y2)
/// @description draw a pixelated black box with white outline
/// @param x1 Left
/// @param y1 Top
/// @param x2 Right
/// @param y2 Bottom
function draw_text_box_blank(argument0, argument1, argument2, argument3) {

	var x1 = argument0;
	var y1 = argument1;
	var x2 = argument2;
	var y2 = argument3;
	var pad = 4;
	var ogColor = draw_get_color();

	draw_set_color(c_white);
	draw_rectangle(x1 + (pad * 2), y1, x2 - (pad * 2), y2, false);
	draw_rectangle(x1 + pad, y1 + pad, x2 - pad, y2 - pad, false);
	draw_rectangle(x1, y1 + (pad * 2), x2, y2 - (pad * 2), false);

	x1 += pad;
	y1 += pad;
	x2 -= pad;
	y2 -= pad;

	draw_set_color(c_black);
	draw_rectangle(x1 + (pad * 2), y1, x2 - (pad * 2), y2, false);
	draw_rectangle(x1 + pad, y1 + pad, x2 - pad, y2 - pad, false);
	draw_rectangle(x1, y1 + (pad * 2), x2, y2 - (pad * 2), false);

	draw_set_color(ogColor);



}
