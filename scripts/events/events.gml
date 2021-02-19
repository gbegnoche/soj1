function eq(_event) {
	if (is_array(_event)) {
		for (var i = 0; i < array_length(_event); i++) {
			ds_queue_enqueue(EVENT_QUEUE, _event[i]);
		}
	} else {
		ds_queue_enqueue(EVENT_QUEUE, _event);
	}
}

function event() constructor {
	complete = false;
	
	static init = function() {
		complete = false;
	}
}

function eq_wait_for_input() : event() constructor {
	static step = function() {
		if (keyboard_check_pressed(vk_anykey)) {
			complete = true;
		}
	}
}

function eq_wait(_seconds) : event() constructor {
	time = _seconds * 60;

	counter = 0;

	static step = function() {
		if (counter >= time) {
			complete = true;
		}
		counter++;
	}
	
	static init = function() {
		complete = false;
		counter = 0;
	}
}

function eq_set_save_data(_key, _value) : event() constructor {
	key = _key;
	value = _value;
	
	static step = function() {
		ds_map_replace(SAVE_DATA, key, value);
		complete = true;
	}
}

function eq_save_game(_saveKey) : event() constructor {
	saveKey = _saveKey;
	
	static step = function() {
		save_game(saveKey);
		complete = true;
	}
}

function eq_screen_fade_out(_fadeSpeed) : event() constructor {
	spd = _fadeSpeed;
	
	static step = function() {
		obj_FadeHandler.alpha += 0.001 * spd;
		if (obj_FadeHandler.alpha >= 1) {
			complete = true;
		}
	}
}

function eq_screen_fade_in(_fadeSpeed) : event() constructor {
	spd = _fadeSpeed;
	
	static step = function() {
		obj_FadeHandler.alpha -= 0.001 * spd;
		if (obj_FadeHandler.alpha <= 0) {
			complete = true;
		}
	}
}

function eq_room_goto(_room) : event() constructor {
	rm = _room;
	
	static step = function() {
		room_goto(rm);
		complete = true;
	}
}

function eq_replace_object(_object, _newObject) : event() constructor {
	obj = _object;
	nObj = _newObject;
	
	static step = function () {
		with (obj) {
			instance_create_layer(x, y, layer, other.nObj);
			instance_destroy();
		}
		complete = true;
	}
}

function eq_change_player_dir(_dir) : event() constructor {
	dr = _dir;
	
	static step = function() {
		obj_Player.facing = dr;
		complete = true;
	}
}

function eq_change_npc_dir(_npc, _dir) : event() constructor {
	npc = _npc;
	dr = _dir;
	
	static step = function() {
		npc.facing = dr;
		complete = true;
	}
}

function eq_textbox(_message, _voice) : event() constructor {
	msg = _message;
	voice = _voice;
	
	msgDraw = "";
	increase = 0.5;
	characters = 0;
	
	x1 = 40;
	x2 = view_get_wport(view_current) - x1;
	y1 = view_get_hport(view_current) - 140;
	y2 = view_get_hport(view_current) - 20;
	width = x2 - x1 - 20;
	
	static step = function() {
		if (characters < string_length(msg)) {
			characters += increase * (1 + button_check_confirm());
			msgDraw = string_copy(msg, 0, characters);
			if (string_char_at(msg, characters div 1) = " ") {
				audio_play_sound(voice, audioPriority.sfxmed, false);
			}
		} else {
			if (button_check_confirm_pressed()) {
				complete = true;
			}
		}
	}
	
	static draw_gui = function() {
		draw_text_box_blank(x1, y1, x2, y2);
		draw_set_color(c_white);
		draw_set_font(fnt_Munro);
		draw_text_ext(60, window_get_height() - 120, msgDraw, 28, width);
	}
	
	static init = function() {
		complete = false;
		msgDraw = "";
		characters = 0;
	}
}

function eq_multitextbox(_message, _queueA, _queueB, _voice, _optionA, _optionB) : eq_textbox(_message, _voice) constructor {
	queA = _queueA;
	queB = _queueB;
	opA = _optionA;
	opB = _optionB;
	
	selection = 0;
	textComplete = false;
	xx = x2 - 160;
	yy = y2 - 80;
	
	static step = function() {
		if (characters < string_length(msg)) {
			characters += increase * (1 + button_check_confirm());
			msgDraw = string_copy(msg, 0, characters);
			if (string_char_at(msg, characters div 1) = " ") {
				audio_play_sound(voice, audioPriority.sfxmed, false);
			}
		} else {
			textComplete = true;
			selection = selection_handler(selection, 1);
			if (button_check_confirm_pressed()) {
				if (selection = 0) {
					while (!ds_queue_empty(queA)) {
						ds_queue_enqueue(EVENT_QUEUE, ds_queue_dequeue(queA));
					}
				} else {
					while (!ds_queue_empty(queB)) {
						ds_queue_enqueue(EVENT_QUEUE, ds_queue_dequeue(queB));
					}
				}
				complete = true;
			}
		}
	}
	
	static draw_gui = function() {
		draw_text_box_blank(x1, y1, x2, y2);
		draw_set_color(c_white);
		draw_set_font(fnt_Munro);
		draw_text_ext(60, window_get_height() - 120, msgDraw, 28, width);
		
		if (textComplete) {
			draw_menu(xx, yy, [opA, opB], selection);
		}
	}
	
	static clean_up = function() {
		if (ds_exists(queA, ds_type_queue)) {
			ds_queue_destroy(queA);
		}
		if (ds_exists(queB, ds_type_queue)) {
			ds_queue_destroy(queB);
		}
	}
	
	static init = function() {
		complete = false;
		msgDraw = "";
		characters = 0;
		selection = 0;
		textComplete = false;
	}
}

function eq_looptextbox(_message, _queueA, _queueB, _voice, _optionA, _optionB) : eq_multitextbox(_message, _queueA, _queueB, _voice, _optionA, _optionB) constructor {	
	static step = function() {
		if (characters < string_length(msg)) {
			characters += increase * (1 + button_check_confirm());
			msgDraw = string_copy(msg, 0, characters);
			if (string_char_at(msg, characters div 1) = " ") {
				audio_play_sound(voice, audioPriority.sfxmed, false);
			}
		} else {
			textComplete = true;
			selection = selection_handler(selection, 1);
			if (button_check_confirm_pressed()) {
				if (selection = 0) {
					while (!ds_queue_empty(queA)) {
						eq(ds_queue_dequeue(queA));
					}
				} else {
					var temp = ds_queue_create();
					ds_queue_copy(temp, queB);
					while (!ds_queue_empty(temp)) {
						var e = ds_queue_dequeue(temp);
						e.init();
						eq(e);
					}
					ds_queue_destroy(temp);
					eq(new eq_looptextbox(msg, queA, queB, voice, opA, opB));
				}
				audio_play_sound(snd_Confirm, audioPriority.sfxmed, false);
				complete = true;
			}
		}
	}
	
	static clean_up = function() {
		if (selection = 0) {
			if (ds_exists(queA, ds_type_queue)) {
				ds_queue_destroy(queA);
			}
			if (ds_exists(queB, ds_type_queue)) {
				ds_queue_destroy(queB);
			}
		}
	}
}

function eq_movement(_object, _path, _speed, _actions) : event() constructor {
	if (!is_array(_object)) {
		objects[0] = _object;
		paths[0] = _path;
		speeds[0] = _speed;
		actions[0] = _actions;
	} else {
		objects = _object;
		paths = _path;
		speeds = _speed;
		actions = _actions;
	}

	started = false;
	
	static step = function() {
		if (!started) {
			for (var i = 0; i < array_length(objects); i++) {
				instance_activate_object(objects[i]);
				with (objects[i]) {
					path_start(other.paths[i], other.speeds[i], other.actions[i], true);
				}
			}
			started = true;
		}
		complete = true;
		for (var i = 0; i < array_length(objects); i++) {
			with (objects[i]) {
				if (path_position < 1 && other.actions[i] == path_action_stop) {
					other.complete = false;
				}
			}
		}
	}
	
	static clean_up = function() {
		for (var i = 0; i < array_length(paths); i++) {
			path_delete(paths[i]);
		}
	}
	
	static init = function() {
		started = false;
	}
}

function eq_create_object(_object, _x, _y) : event() constructor {
	obj = _object;
	xx = _x;
	yy = _y;
	
	static step = function() {
		instance_create_layer(xx, yy, "il_Actors", obj);
		complete = true;
	}
}

function eq_change_sprite(_target, _sprite) : event() constructor {
	target = _target;
	sprite = _sprite;
	
	static step = function() {
		target.sprite_index = sprite;
		complete = true;
	}
}

function eq_audio_stop(_sound, _fade) : event() constructor {
	audio = _sound;
	fade = _fade;
	
	static step = function() {
		if (string_pos("snd", object_get_name(audio))) {
			with (obj_MusicHandler) {
				sfx = 0;
				sfxStarted = false;
				sfxLoop = false;
				sfxLoopDelay = 0;
			}
		} else {
			song_switch(-1);
		}
		complete = true;
	}
}

function eq_audio_play(_sound, _loops, _loopDelay) : event() constructor {
	audio = _sound;
	loops = _loops;
	loopDelay = _loopDelay;

	static step = function() {
		if (string_pos("snd", audio_get_name(audio))) {
			with (obj_MusicHandler) {
				if (sfx == 0) {
					sfx = other.audio;
					sfxStarted = false;
					sfxLoop = other.loops;
					sfxLoopDelay = other.loopDelay;
				}
			}
		} else {
			song_switch(audio);
		}
		complete = true;
	}
}

function eq_menu_list_remove_all() : event() constructor {
	static step = function() {
		menu_list_remove_all();
		complete = true;
	}
}
