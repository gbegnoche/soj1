if (button_check_confirm_pressed()) {
	if (instance_exists(obj_Player) && !obj_Game.pause) {
		if (distance_to_object(obj_Player) < range) {
			event_queue_audio_play(snd_Confirm, false, EVENT_QUEUE);
			event_queue_textbox("You got a 'shroom!", EVENT_QUEUE);
			
			inventory_add_item("Shroom", "sprite", spr_ShroomItem);
			SAVE_DATA[? saveKey] = true;
			instance_destroy();
		}
	}
}
