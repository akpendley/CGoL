/// @description increase speed

// since alarm speed is a wait time, decreasing it increases speed
alarmSpeed--;

// validate data
alarmSpeed = clamp(alarmSpeed, 1, 12000);