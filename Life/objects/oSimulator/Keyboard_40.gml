/// @description decrease speed

// since alarm speed is a wait time, increasing it decreases speed
alarmSpeed++;

// validate data
alarmSpeed = clamp(alarmSpeed, 1, 12000);