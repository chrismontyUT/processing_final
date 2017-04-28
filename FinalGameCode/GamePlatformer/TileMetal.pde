class TileMetal extends Tile{
  
  public TileMetal(int xLocation, int yLocation)
  {
    super(xLocation, yLocation);
    image = loadImage("metal.png");
  }
  
  void display()
  {
    image(image, xLocation * size, yLocation * size);
    image.resize(45,45);
  }
  
  boolean checkCollision(Player player)
  {
    return true;
  }
}