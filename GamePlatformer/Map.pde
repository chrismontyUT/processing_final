class Map {
  
  Tile[][] tiles;
  
  Laser[] lasers;
  int num_lasers = 0;
  
  PImage image_black = loadImage("black.png");
  PImage image_metal = loadImage("metal.png");
  // This is the final image that we render each frame, compositied from
  // the individual tiles.
  PImage image_final = createImage(1215, 675, RGB);
  
  Map(int mapSizeX, int mapSizeY) {
    tiles = new Tile[mapSizeX][mapSizeY];
    lasers = new Laser[10];
    // Fill backround with black tiles to start with
    for(int x = 0; x < mapSizeX;x++) { 
      for(int y = 0; y < mapSizeY; y++) {  
        tiles[x][y] = new Tile(x, y, 0);
      }
    }
    image_metal.resize(45, 45);
  }
  
  void add_tile(int x , int y, int type) {
    tiles[x][y] = new Tile(x, y, type);
    // Copy pixels to the correct spot image_final from the tile image
    image_final.copy(image_metal, 0, 0, 45, 45, x * 45, y * 45, 45, 45);
  }
  
  void add_laser(int x, int y, int dir, int range) {
    println("added laser");
    lasers[num_lasers] = new Laser(x, y, dir, range);
    println("lasers length: " + lasers.length);
    num_lasers++;
  }
  
  void display() {
    image(image_final, 0, 0);
    println(num_lasers);
    for(int i = 0; i < num_lasers; i++) {
      lasers[i].display();
    }
  }
  
  boolean top_left_of_player(){                    //returns true if top left corner of player is occupied by a metal tile
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
  
 