class Map{
  boolean level1;
  
  Tile[][] tiles;
  Map(int mapSizeX, int mapSizeY)
  {
    tiles = new Tile[mapSizeX][mapSizeY];
   //background 
   for(int x = 0; x < mapSizeX;x++)
   {
     for(int y = 0; y < mapSizeY; y++)
     {
       tiles[x][y] = new TileBlack(x,y);
     }
   }
   if (level1 == false){
   tiles[0][2] = new TileMetal(0,2);
   tiles[1][2] = new TileMetal(1,2);
   
  }
  }
  
  void display()
  {
   for(Tile[] x: tiles)
   {
     for(Tile y: x)
     {
       y.display();
     }
   }
  }
  
}