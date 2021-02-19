function log(str) {
	show_debug_message(str);
}

function print_player_state() {
	var s;
	
	switch(obj_Player.state) {
		case PlayerState.idle:
			s = "idle";
			break;
		case PlayerState.run:
			s = "run";
			break;
		case PlayerState.attack:
			s = "attack";
			break;
		case PlayerState.combo:
			s = "combo";
			break;
		case PlayerState.talk:
			s = "talk";
			break;
		default:
			s = "print_player_state() switch statement reached default"
	}
	
	log("Player state: " + s)
}

function debug_add(_function) {
	ds_list_add(obj_DebugHandler.debugList, _function);
}
