/// @description create live cell

// get the layer id for the tile layer
var layer_id = layer_get_id("Tiles");

// get the tilemap from the tile layer id
var tm = layer_tilemap_get_id(layer_id);

// get the tiledata from the tile under the mouse coordinates
var td = tilemap_get_at_pixel(tm, mouse_x, mouse_y);

// set index to 1, living cell (white tile)
td = tile_set_index(td, 1);

// commit our changes to the tiledata
tilemap_set_at_pixel(tm, td, mouse_x, mouse_y);