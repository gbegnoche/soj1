if (instance_exists(obj_Player)) {
	var xx = PLAYER_X;
	var yy = PLAYER_Y;
	switch(facingBefore) {
		case dir.up: yy += 10; break;
		case dir.down: yy += 3; break;
		case dir.right: xx -= 3; break;
		case dir.left: xx += 3; break;
	}
	if (active && (obj_Player.facing == facingBefore || facingBefore == -1) && position_meeting(xx, yy, id)) {
		obj_Game.doorIndex = index;
		eq(new eq_screen_fade_out(fadeSpeed.fast));
		eq(new eq_room_goto(roomTo));
		eq(new eq_screen_fade_in(fadeSpeed.fast));
		audio_play_sound(snd_PlayerHurt, audioPriority.sfxmed, false); //TO-DO better sound
		active = false;
	}
}
