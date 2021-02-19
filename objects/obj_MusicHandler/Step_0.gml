 if ((nextSong != currentSong) && (currentSong == 0 || audio_sound_get_gain(currentSong) == 0)) {
	if (currentSong != 0) {
		audio_stop_sound(currentSong);
	}
	currentSong = nextSong;
	audio_sound_gain(currentSong, 0, 0);
	audio_play_sound(currentSong, audioPriority.music, true);
	audio_sound_gain(currentSong, 1, fade);
}
if (sfx && !sfxStarted) {
	audio_play_sound(sfx, audioPriority.sfxmed, false);
	if (sfxLoop) {
		alarm_set(0, sfxLoopDelay);
	}
	sfxStarted = true;
}
