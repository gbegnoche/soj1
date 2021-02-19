function song_switch(_song) {
	with (obj_MusicHandler) {
		if (_song != currentSong) {
			nextSong = _song;
			if (currentSong != -1) {
				audio_sound_gain(currentSong, 0, fade);
			}
		}
	}
}
