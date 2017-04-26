/*PImage[] images;


class ItemGroup {
  ArrayList<Item> itemgroups;
  PVector origin;

  ItemGroup() {
    itemgroups = new ArrayList<Item>();
  }

  void addItem(int x, int y, int effect, PImage img) {
    itemgroups.add(new Item(x, y, effect, img));
  }

  void run() {
    for (int i = itemgroups.size()-1; i >= 0; i--) {
      Item p = itemgroups.get(i);
      if (p.isdead == true) {
        itemgroups.remove(i);
      }
    }
  }
}



class Item {

  int ItemX;
  int ItemY;
  int wid;
  int heig;
  int points;
  PImage appear;
  boolean isdead;
  Item(int x, int y, int effect, PImage img)
  {
    ItemX = x;
    ItemY = y;
    appear = img;
    points = effect;    
    wid = img.width;
    heig = img.height;
    isdead = false;
  }

  void iscatch() {
    if (points>0) {
      if (mousePressed == true) {
        if (player.getPlayerX() <= ItemX+wid && player.getPlayerX()>=ItemX && player.getPlayerY() <= ItemY && player.getPlayerY() >= ItemY-heig) {
          player.health = player.health + points;
          isdead = true;
        }
      }
    } else {
      if (player.getPlayerX() <= ItemX+wid && player.getPlayerX()>=ItemX && player.getPlayerY() <= ItemY && player.getPlayerY() >= ItemY-heig) {
        player.health = player.health + points;
        isdead = true;
      }
    }
  }

  void display() {
    if (isdead == true) {
      image(appear, ItemX, ItemY);
    }
  }
}*/