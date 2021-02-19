if (!(other.knockedBack)) {
	other.knockedBack = true;
	other.hp -= damage;
	with (other) {
		alarm_set(0, 8);
		audio_play_sound(snd_EnemyHurt, audioPriority.sfxmed, false);
	}
	other.direction = point_direction(x, y, other.x, other.y);
	other.speed = knockback;
}