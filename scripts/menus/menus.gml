function option(_name, _function) constructor {
	name = _name;
	func = _function;
}

function menu(_x, _y, _options) constructor {
	xx = _x;
	yy = _y;
	options = _options;

	selection = 0;
	persist = true;
	// set menu width, equal to the longest option
	xx2 = 0;
	for (var j = 0; j < array_length(options); j++) {
		var w = xx + string_width(options[j].name) + 80;
		if (xx2 < w) {
			xx2 = w;
		}
	}
	//set menu height, based on number of options x 40
	var h = yy + ((array_length(options) * 40) + 20)
	yy2 = h;
	
	draw_set_font(fnt_Munro);
	
	static step = function() {
		selection = selection_handler(selection, array_length(options) - 1);
		
		if (button_check_confirm_pressed()) {
			options[selection].func();
			audio_play_sound(snd_Confirm, audioPriority.sfxmed, false);
		}
	}
	
	static draw_gui = function() {
		draw_text_box_blank(xx, yy, xx2, yy2);

		for (var i = 0; i < array_length(options); i++) {
			if (i == selection) {
				draw_set_color(c_yellow);
			} else {
				draw_set_color(c_white);
			}
			var text = options[i].name;
			draw_text(xx + 20, (yy + 20) + (i * 40), text);
		}
	}
}

function menu_ext(_x, _y, _options, _align, _border, _spacing, _persistent) : menu(_x, _y, _options) constructor {
	aln = _align;
	border = _border;
	spacing = _spacing;
	persist = _persistent;
	
	// set menu height, based on number of options x spacing
	var h = yy + ((array_length(options) * spacing) + 20)
	yy2 = h;
	
	// set alignment
	var width = xx2 - xx;
	switch(aln) {
		case align.center:
			//xx = xx - (width / 2);
			//xx2 = xx2 - (width / 2);
			break;
		case align.right:
			xx -= width;
			xx2 -= width
			break;
		case align.left:
		default:
			break;
	}
	
	static draw_gui = function() {
		// set alignment
		switch(aln) {
			case align.center:
				draw_set_halign(fa_center);
				break;
			case align.right:
				draw_set_halign(fa_right);
				break;
			case align.left:
			default:
				draw_set_halign(fa_left);
				break;
		}
		
		if (border) {
			draw_text_box_blank(xx, yy, xx2, yy2);
		} else {
			draw_set_color(c_black);
			draw_rectangle(xx, yy, xx2, yy2, false);
		} 

		for (var i = 0; i < array_length(options); i++) {
			if (i == selection) {
				draw_set_color(c_yellow);
			} else {
				draw_set_color(c_white);
			}
			var text = options[i].name;
			draw_text(xx + 20, (yy + 20) + (i * spacing), text);
		}
		
		draw_set_halign(fa_left);
	}
}

function menu_titled(_x, _y, _title, _options) : menu(_x, _y, _options) constructor {
	title = _title;
	
	static draw_gui = function() {
		var w = string_width(title) + 40;
		var h = string_height(title) + 30;
		draw_text_box_blank(xx, yy - h, xx + w, yy);
		draw_text(xx + 20, yy - ((h + string_height(title)) / 2), title);
		
		var xx2 = 0;
		for (var j = 0; j < array_length(options); j++) {
			var w = xx + string_width(options[j].name) + 80;
			if (xx2 < w) {
				xx2 = w;
			}
		}
		var h = yy + ((array_length(options) * 40) + 20)
		var yy2 = h;

		draw_text_box_blank(xx, yy, xx2, yy2);

		for (var i = 0; i < array_length(options); i++) {
			if (i == selection) {
				draw_set_color(c_yellow);
			} else {
				draw_set_color(c_white);
			}
			var text = options[i].name;
			draw_text(xx + 20, (yy + 20) + (i * 40), text);
		}
	}
}

function menu_input(_x, _y, _title, _default, _callback) constructor {
	xx = _x;
	yy = _y;
	title = _title;
	callback = _callback;
	
	selX = 0;
	selY = 0;
	input = _default;
	inputLength = 8;
	inputH = (string_height(title) + 30) * 2;
	inputW = max(string_width(title) + 40, 200)
	selectH = (string_height("A") + 12) * 5;
	selectW = (string_width("A") + 32) * 7;
	displayedOptions = [];
	uppercaseOptions = [];
	lowercaseOptions = [];
	
	static step = function() {
		if (button_check_down_pressed()) {
			selY += 1;
			if (selY > array_length(displayedOptions) - 1) {
				selY = 0;
			}
			audio_play_sound(snd_MoveCursor, audioPriority.sfxmed, false);
		}
		if (button_check_up_pressed()) {
			selY -= 1;
			if (selY < 0) {
				selY = array_length(displayedOptions) - 1;
			}
			audio_play_sound(snd_MoveCursor, audioPriority.sfxmed, false);
		}
		if (button_check_right_pressed()) {
			selX += 1;
			if (selX > array_length(displayedOptions[selY]) - 1) {
				selX = 0;
			}
			audio_play_sound(snd_MoveCursor, audioPriority.sfxmed, false);
		}
		if (button_check_left_pressed()) {
			selX -= 1;
			if (selX < 0) {
				selX = array_length(displayedOptions[selY]) - 1;
			}
			audio_play_sound(snd_MoveCursor, audioPriority.sfxmed, false);
		}
		if (button_check_confirm_pressed()) {
			displayedOptions[selY][selX].func();
		}
	}
	
	static draw_gui = function() {
		draw_text_box_blank(xx, yy, xx + inputW, yy + inputH);
		draw_text_box_blank(xx, yy + inputH, xx + selectW, yy + inputH + selectH);
		draw_set_color(c_white);
		draw_text(xx + 20, yy + 15, title);
		for (var i = 1; i <= inputLength; i++) {
			if (string_char_at(input, i) != "") {
				draw_text((xx + 20) + (i * 18), yy + string_height(title) + 30, string_char_at(input, i));
			} else {
				draw_text((xx + 20) + (i * 18), yy + string_height(title) + 30, "_");
			}
		}
		for (var j = 0; j < array_length(displayedOptions); j++) {
			for (var k = 0; k < array_length(displayedOptions[0]); k++) {
				if (selX == k && selY == j) {
					draw_set_color(c_yellow);
					// TO-DO: decide which of these two things looks less bad vvv
					//draw_rectangle(
					//	(x + 16) + (k * 30),
					//	(y + inputH) + ((j + 1) * 40),
					//	(x + 32) + (k * 30),
					//	(y + inputH + 2) + ((j + 1) * 40),
					//	false
					//);
					draw_text((xx + 20) + (k * 30), (yy + inputH + 18) + (j * 40), "_");
				}
				draw_text((xx + 20) + (k * 30), (yy + inputH + 15) + (j * 40), displayedOptions[j][k].name);
				draw_set_color(c_white);
			}
		}
	}
	
	static shift = function() {
		if (displayedOptions == uppercaseOptions) {
			displayedOptions = lowercaseOptions;
		} else {
			displayedOptions = uppercaseOptions;
		}
		audio_play_sound(snd_Confirm, audioPriority.sfxmed, false);
	}
	
	static cancel = function() {
		menu_list_remove();
		audio_play_sound(snd_EnemyHurt, audioPriority.sfxmed, false); // TO-DO
	}
	
	static write_char = function(_char) {
		input += _char;
		audio_play_sound(snd_Confirm, audioPriority.sfxmed, false);
	}
	
	static delete_char = function() {
		input = string_delete(input, string_length(input), 1);
		audio_play_sound(snd_EnemyHurt, audioPriority.sfxmed, false); // TO-DO
	}
	
	uppercaseOptions = [
		[
			new option("A", function() { write_char("A") }),
			new option("B", function() { write_char("B") }),
			new option("C", function() { write_char("C") }),
			new option("D", function() { write_char("D") }),
			new option("E", function() { write_char("E") }),
			new option("F", function() { write_char("F") }),
			new option("G", function() { write_char("G") }),
			new option("DEL", function() { delete_char() }),
		],
		[
			new option("H", function() { write_char("H") }),
			new option("I", function() { write_char("I") }),
			new option("J", function() { write_char("J") }),
			new option("K", function() { write_char("K") }),
			new option("L", function() { write_char("L") }),
			new option("M", function() { write_char("M") }),
			new option("N", function() { write_char("N") }),
			new option("SHIFT", function() { shift() }),
		],
		[
			new option("O", function() { write_char("O") }),
			new option("P", function() { write_char("P") }),
			new option("Q", function() { write_char("Q") }),
			new option("R", function() { write_char("R") }),
			new option("S", function() { write_char("S") }),
			new option("T", function() { write_char("T") }),
			new option("U", function() { write_char("U") }),
			new option("END", function () { callback(input); audio_play_sfx(snd_Confirm); }),
		],
		[
			new option("V", function() { write_char("V") }),
			new option("W", function() { write_char("W") }),
			new option("X", function() { write_char("X") }),
			new option("Y", function() { write_char("Y") }),
			new option("Z", function() { write_char("Z") }),
			new option("-", function() { write_char("-") }),
			new option(" ", function() { write_char(" ") }),
			new option("CANCEL", function() { cancel() }),
		],
	];
	lowercaseOptions = [
		[
			new option("a", function() { write_char("a") }),
			new option("b", function() { write_char("b") }),
			new option("c", function() { write_char("c") }),
			new option("d", function() { write_char("d") }),
			new option("e", function() { write_char("e") }),
			new option("f", function() { write_char("f") }),
			new option("g", function() { write_char("g") }),
			new option("del", function() { delete_char() }),
		],
		[
			new option("h", function() { write_char("h") }),
			new option("i", function() { write_char("i") }),
			new option("j", function() { write_char("j") }),
			new option("k", function() { write_char("k") }),
			new option("l", function() { write_char("l") }),
			new option("m", function() { write_char("m") }),
			new option("n", function() { write_char("n") }),
			new option("shift", function() { shift() }),
		],
		[
			new option("o", function() { write_char("o") }),
			new option("p", function() { write_char("p") }),
			new option("q", function() { write_char("q") }),
			new option("r", function() { write_char("r") }),
			new option("s", function() { write_char("s") }),
			new option("t", function() { write_char("t") }),
			new option("u", function() { write_char("u") }),
			new option("end", function() { callback(input); audio_play_sfx(snd_Confirm); }),
		],
		[
			new option("v", function() { write_char("v") }),
			new option("w", function() { write_char("w") }),
			new option("x", function() { write_char("x") }),
			new option("y", function() { write_char("y") }),
			new option("z", function() { write_char("z") }),
			new option("-", function() { write_char("-") }),
			new option(" ", function() { write_char(" ") }),
			new option("cancel", function() { cancel() }),
		],
	];
	displayedOptions = uppercaseOptions;
}

function menu_list_add(_menu) {
	ds_list_add(MENU_LIST, _menu);
}

function menu_list_remove() {
	var lastIndex = ds_list_size(MENU_LIST) - 1;
	var activeMenu = ds_list_find_value(MENU_LIST, lastIndex);
	
	ds_list_delete(MENU_LIST, lastIndex);
	delete activeMenu;
	if (ds_list_empty(MENU_LIST)) {
		UNPAUSE;
	}
}

function menu_list_remove_all() {
	while(!ds_list_empty(MENU_LIST)) {
		menu_list_remove();
	}
}

function selection_handler(_currentSelection, _max) {

	var s = _currentSelection;
	var mx = _max;

	if (button_check_down_pressed()) {
		s++;
		if (s > mx) {
			s = 0;
		}
		audio_play_sound(snd_MoveCursor, audioPriority.sfxmed, false);
	} else if (button_check_up_pressed()) {
		s--;
		if (s < 0) {
			s = mx;
		}
		audio_play_sound(snd_MoveCursor, audioPriority.sfxmed, false);
	}

	return s;
}
