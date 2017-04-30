class Map {
  
  Tile[][] tiles;
  
  PImage image_black = loadImage("black.png");
  PImage image_metal = loadImage("metal.png");
  
  Map(int mapSizeX, int mapSizeY) {
    tiles = new Tile[mapSizeX][mapSizeY];
    // Fill backround with black tiles to start with
    for(int x = 0; x < mapSizeX;x++) { 
      for(int y = 0; y < mapSizeY; y++) {  
        tiles[x][y] = new Tile(x, y, 0);
      }
    }  
  }
  
  void add_tile(int x , int y, int type) {
    tiles[x][y] = new Tile(x, y, type);
  }
  
  void display() {
    
    // Iterate through all tiles
    for(Tile[] row: tiles) {
      for(Tile tile: row) {
        // Choose image to display based on tile type
        switch(tile.type) {
          case 0:
            image(image_black, tile.x * tile.size, tile.y * tile.size, tile.size, tile.size);
            break;
          case 1:
            image(image_metal, tile.x * tile.size, tile.y * tile.size, tile.size, tile.size);
            break;
          default:
            break;
        }
      }
    }  
  }
  
  public boolean top_left_of_player(){                    //returns true if top left corner of player is occupied by a metal tile
    if(tiles[player.playerX / 90][player.playerY / 90].type == 1){
      return true;
    }
    else{
      return false;
    }
  }
  public boolean top_right_of_player(){                    // returns true if top right corner of player is occupied by a metal tile
    if(tiles[(player.playerX + player.images[0].width) / 90][player.playerY / 90].type == 1){
      return true;
     }
     else{
       return false;
     }
  }
  public boolean bottom_left_of_player(){                  //returns true if bottom left corner of player is occupied by a metal tile
    if(tiles[player.playerX / 90][(player.playerY + player.images[0].height) / 90].type == 1){
      return true;
    }
    else{
      return false;
    }
  }
  public boolean bottom_right_of_player(){                //returns true if the bottom right corner of the player is occuoied by a metal tile
    if(tiles[(player.playerX + player.images[0].width) / 90][(player.playerY + player.images[0].height) / 90].type == 1){
      return true;
    }
    else{
       return false;
    }
  }
  
  
}
  
 