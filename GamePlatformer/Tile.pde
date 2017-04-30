// Tiles types:
// 0 - Black
// 1 - Metal
// 2 - door bottom
// 3 - door top

class Tile{
  int size = 45;
  int x, y;
  int type;
  boolean isMetal = false; // TODO: What is this for?
  
  public Tile(int x, int y, int type) { 
    this.x = x;
    this.y = y;
    this.type = type;
  }
  
  boolean checkCollision(Player player) {
    return false;
    // TODO: Check if this should actually be here. 
  }

}