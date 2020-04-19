/// @description on screen text

// only draw text when hide info is off (false)
if (!hideInfo)
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	
	// while paused draw the room name and controls
	if (global.pause)
	{
		draw_set_font(fPause);
		draw_text(10, room_height / 2 - 120, "PAUSE");
		draw_text(10, room_height - 80, roomNames[? room]);
		draw_set_font(fStats);
		draw_text(10, room_height / 2, "paint cell - left/right click\nresume - space\nreset level - r\nhide info - h\nnext level - tab\nspeed - up/down\nquit - esc");
	}
	
	// stats in the top left
	
	draw_set_font(fStats);
	draw_text(10, 10, "GENERATIONS " + string(generation) + "\nPOPULATION " + string(population) + "\nSPEED " + string(1 / alarmSpeed * 100) + "%");
}