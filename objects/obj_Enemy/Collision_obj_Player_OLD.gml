if (!other.invincible) {
	obj_Game.currentHP -= damage;
	with (other) {
		invincible = true;
		knockedBack = true;
		alarm_set(0, 10);
		audio_play_sound(snd_PlayerHurt, audioPriority.sfxmed, false);
		switch (facing) {
			case dir.down:
				sprite_index = spr_PlayerHurtDown;
				break;
			case dir.up:
				sprite_index = spr_PlayerHurtUp;
				break;
			case dir.right:
				sprite_index = spr_PlayerHurtRight;
				break;
			case dir.left:
				sprite_index = spr_PlayerHurtLeft;
				break;
			default:
				sprite_index = spr_PlayerIdleDown;
				facing = dir.down;
		}
	}
	other.direction = point_direction(x, y, other.x, other.y);
	other.speed = knockback;
}