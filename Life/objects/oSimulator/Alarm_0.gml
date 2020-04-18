// get the layer id from string (set in room)
var layer_id = layer_get_id("Tiles");

// get the tilemap from the layer id
var tm = layer_tilemap_get_id(layer_id);

// this new list will hold tiledata from each cell in the tilemap to create
// the next frame of the simulation. We need to calculate whether each cell dies before
// changing any cell
var newGen = ds_list_create();

// population is recounted every simulation frame
population = 0;

// make a list of all of the newly calculated tile data
for (var i = 1; i < tilemap_get_height(tm) - 1; i++)
{
	// loop rows
	for (var j = 1; j < tilemap_get_width(tm) - 1; j++)
	{
		// loop columns
		// count living neighbors
		var count = 0;
		
		// get tiledata from cell position
		var td = tilemap_get(tm, j, i);
		
		// since we're only using elements 0 and 1 of the tileset (the unusable first transparent
		// image, and a white square) a white square evaluates as true, and transparent as false
		if tile_get_index(tilemap_get(tm, j + 1, i)) count++;
		if tile_get_index(tilemap_get(tm, j - 1, i)) count++;
		if tile_get_index(tilemap_get(tm, j, i - 1)) count++;
		if tile_get_index(tilemap_get(tm, j, i + 1)) count++;
		if tile_get_index(tilemap_get(tm, j + 1, i + 1)) count++;
		if tile_get_index(tilemap_get(tm, j - 1, i - 1)) count++;
		if tile_get_index(tilemap_get(tm, j + 1, i - 1)) count++;
		if tile_get_index(tilemap_get(tm, j - 1, i + 1)) count++;		
		
		
		// the rules of the game are as follows:
		// 1. Any live cell with two or three live neighbors survives.
		// 2. Any dead cell with three live neighbors becomes a live cell.
		// 3. All other live cells die in the next generation. Similarly, all other dead cells stay dead.
		
		// change the tiledata based on living neighbors
		switch(count)
		{
			case 2:
				// 1. survival
				break;
			case 3:
				// 1. survival and 2. new life
				td = tile_set_index(td, 1);
				break;
			default:
				// 3. otherwise die
				td = tile_set_index(td, 0);
				break;
		}
		
		// add the new tiledata to the list
		ds_list_add(newGen, td);
	}
}

// counter
var index = 0;

// run through the tilemap again and set all tiles to their new values
for (var i = 1; i < tilemap_get_height(tm) - 1; i++)
{
	// loop rows
	for (var j = 1; j < tilemap_get_width(tm) - 1; j++)
	{
		// loop columns
		
		// extract tiledata from the list
		var data = newGen[| index];
		
		// increment population if tile_get_index returns 1 (true, a white square, 2nd element of tsTiles tileset resource)
		if (tile_get_index(data)) population++;
		
		// commit tiledata changes to the tilemap
		tilemap_set(tm, data, j, i);
		
		// increment list counter
		index++;
	}
}

// increment simulation frames since room start
generation++;

// if we aren't paused
if (!global.pause)
{
	// queue the next simulation frame for alarmSpeed steps in the future
	alarm[0] = alarmSpeed;
}