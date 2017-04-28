abstract class Tile
{
  int size = 45;
  int xLocation;
  int yLocation;
  PImage image;
  
  public Tile(int xLocation, int yLocation)
  { 
    this.xLocation = xLocation;
    this.yLocation = yLocation;
  }
  

  abstract void display();
  abstract boolean checkCollision(Player player);
}