if (!audio_is_playing(music_scene1)) {
    audio_play_sound(music_scene1, 1, true);
}

if (time_to_sound > 0) {
    time_to_sound -= 1;
}

if (time_to_sound == 0) {
    audio_play_sound(sound1_scene1, 1, true);
    time_to_sound = -1;
}