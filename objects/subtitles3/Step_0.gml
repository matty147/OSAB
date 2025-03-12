if (current_subtitle < array_length(subtitles) - 1) {
    if (frame_counter >= subtitles[current_subtitle + 1].time) {
        current_subtitle += 1;
        subtitle_text = subtitles[current_subtitle].text;
    }
}

frame_counter += 1;
