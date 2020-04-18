/// @description pause

// toggle pause
global.pause = !global.pause;

// simulation will not continue running if the game is paused, 
// so this only effectively works when un-pausing
alarm[0] = alarmSpeed;