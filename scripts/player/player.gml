// functions handling player control
function player_facing_switch(
	left,
	right,
	up,
	down
	) {
	switch(facing) {
		case dir.left:
			left();
			break;
		case dir.right:
			right();
			break;
		case dir.up:
			up();
			break;
		case dir.down:
			down();
			break;
		default:
			log("Reached default case in 'player facing' switch")
			facing = dir.down;
	}		
}

function player_state_switch(
	idle,
	run,
	attack,
	combo
	) {
	switch (state) {
	case PlayerState.idle:
		idle();
		break;
	case PlayerState.run:
		run();
		break;
	case PlayerState.attack:
		attack();
		break;
	case PlayerState.combo:
		combo();
		break;
	default:
		show_debug_message("Player reached default state");
		state = PlayerState.idle;
	}
}
