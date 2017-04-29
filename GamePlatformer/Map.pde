class Map{
  boolean level1;
  boolean[][] metal = new boolean[27][20];
  
  Tile[][] tiles;
  Map(int mapSizeX, int mapSizeY){
    tiles = new Tile[mapSizeX][mapSizeY];
   //background 
   for(int x = 0; x < mapSizeX;x++){ 
     for(int y = 0; y < mapSizeY; y++){  
       tiles[x][y] = new TileBlack(x,y);
       }
     }  
    }
    
    
    
    
  void add_tile(int x , int y){
    tiles[x][y] = new TileMetal(x,y);
    metal[x][y] = true;
  }
  
  
  
  
  void display(){
    for(Tile[] x: tiles){
      for(Tile y: x){
       y.display();
       }
     }
   }
  public boolean top_left_of_player(){                    //returns true if top left corner of player is occupied by a metal tile
    if(metal[player.playerX / 90][player.playerY / 90] == true){
      return true;
    }
    else{
      return false;
    }
  }
  public boolean top_right_of_player(){                    // returns true if top right corner of player is occupied by a metal tile
    if(metal[(player.playerX + player.images[0].width) / 90][player.playerY / 90] == true){
      return true;
     }
     else{
       return false;
     }
  }
  public boolean bottom_left_of_player(){                  //returns true if bottom left corner of player is occupied by a metal tile
    if(metal[player.playerX / 90][(player.playerY + player.images[0].height) / 90] == true){
      return true;
    }
    else{
      return false;
    }
  }
  public boolean bottom_right_of_player(){                //returns true if the bottom right corner of the player is occuoied by a metal tile
    if(metal[(player.playerX + player.images[0].width) / 90][(player.playerY + player.images[0].height) / 90] == true){
      return true;
    }
    else{
       return false;
    }
  }
  
  
}
  
 