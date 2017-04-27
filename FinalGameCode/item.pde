
float playx = 150;
float playy = 380;
float point;
float life;

void setupitems() {
  bombname = append(bombname, "bomb.png");
  bombname = append(bombname, "bombFlash.png" );
  coinname = append(coinname, "coinBronze.png");
  coinname = append(coinname, "coinSilver.png");
  coinname = append(coinname, "coinGold.png");
  mushroom = append(mushroom, "mushroomBrown.png");
  mushroom = append(mushroom, "mushroomRed.png");
  gemname = append(gemname, "gemGreen.png");
  gemname = append(gemname, "gemBlue.png");
  gemname = append(gemname, "gemRed.png");
  gemname = append(gemname, "gemYellow.png");

  items[0][0] = loadImage("bomb.png");
  items[0][1] = loadImage("bombFlash.png");
  items[1][0] = loadImage("coinBronze.png");
  items[1][1] = loadImage("coinSilver.png");
  items[1][2] = loadImage("coinGold.png");
  items[2][0] = loadImage("mushroomBrown.png");
  items[2][1] = loadImage("mushroomRed.png");
  items[3][0] = loadImage("gemGreen.png");
  items[3][1] = loadImage("gemBlue.png");
  items[3][2] = loadImage("gemRed.png");
  items[3][3] = loadImage("gemYellow.png");
}

class ItemGroup {
  ArrayList<Item> itemgroups;
  PVector origin;

  ItemGroup() {
    itemgroups = new ArrayList<Item>();
    point = 0;
    life = 0;
  }

  void addItem(int x, int y, float effect, float pits, int index) {
    itemgroups.add(new Item(x, y, effect, pits, index));
  }
  void update() {
    playx = protagonist.xpos;
    playy = protagonist.ypos;
  }

  void run() {
    for (int i = itemgroups.size()-1; i >= 0; i--) {
      Item p = itemgroups.get(i);
      p.show();
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
  float points;
  PImage appear;
  int index;
  boolean isdead;
  float eff;
  int counter;
  float timer;
  int len;

  Item(int x, int y, float pointss, float effect, int ind)
  {
    ItemX = x;
    ItemY = y;
    appear = img;
    points = pointss;    
    eff = effect;
    wid = img.width;
    heig = img.height;
    index = ind;
    isdead = false;
    len = 0;
    counter = 0;
    if(ind == 0){len = 2;}
    if(ind == 1){len = 3;}
    if(ind == 2){len = 2;}
    if(ind == 3){len = 4;}
    
  }
  void show() {
    if (timer == 10) {
      counter = counter + 1;
      timer = 0;
    }
    if (counter >= len) {
      counter = 0;
    }
    image(items[index][counter], ItemX, ItemY);
  }

  void iscatch() {
    if (points>0) {
      if (mousePressed == true) {
        if (playx <= ItemX+wid && playx>=ItemX && playy<= ItemY && playy>= ItemY-heig) {
          point = point + points;
          isdead = true;
          life = life + eff;
        }
      }
    } else {
      if (playx <= ItemX+wid && playx>=ItemX && playy <= ItemY && playy >= ItemY-heig) {
        point = point + points;
        isdead = true;
        life = life + eff;
      }
    }
  }

  void display() {
    if (isdead == true) {
      image(appear, ItemX, ItemY);
    }
  }
}