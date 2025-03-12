subtitles = [
    { time: 0, text: "" },
    { time: room_speed * 3, text: "friends: Hello" },
    { time: room_speed * 5, text: "helpers: Hey guys" },
	{ time: room_speed * 8, text: "helpers: We need to show you something" },
	{ time: room_speed * 13, text: "helpers: There is this weird statue, maybe here you can beat the ruler. If you want we will be very glad" }
];

current_subtitle = 0;
frame_counter = 0;

subtitle_text = subtitles[0].text;
