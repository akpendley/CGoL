// global variable to keep the game from simulating
global.pause = false;

// number of white cells counted this simulation frame
population = 0;

// cumulative simulation frames since room start
generation = 0;

// boolean to hide the drawing of additional GUI info
hideInfo = false;

// user adjusted number of frames between simulations (default of 1 is max speed)
alarmSpeed = 1;

// list of names for each room
roomNames = ds_map_create();
roomNames[? rMain] = "Conway's Game of Life";
roomNames[? rGliderGun] = "Gosper Glider Gun";
roomNames[? rSimkinGun] = "Simkin Glider Gun";
roomNames[? rSpaceships] = "Spaceships";
roomNames[? rEmpty] = "Build your own";

// begin simulating in 10 steps
alarm[0] = 10;