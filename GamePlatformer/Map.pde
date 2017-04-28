class Map{
  boolean level1;
  
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
  }
  
  
  
  
  void display(){
    for(Tile[] x: tiles){
      for(Tile y: x){
       y.display();
       }
     }
   }
  
}