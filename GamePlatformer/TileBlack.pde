class TileBlack extends Tile{
  
  public TileBlack(int xLocation, int yLocation)
  {
    super(xLocation, yLocation);
    image = loadImage("black.png");
   
  }
  
  void display()
  {
    image(image, xLocation * size, yLocation * size);
  }
  
  boolean checkCollision(Player player)
  {
    return true;
  }
  
}