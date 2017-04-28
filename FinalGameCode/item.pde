
float playx = 150;
float playy = 380;
float point;
float life;


class ItemGroup {
  ArrayList<Item> itemgroups;
  PVector origin;

  ItemGroup() {
    itemgroups = new ArrayList<Item>();
    point = 0;
    life = 0;
  }

  void addItem(int x, int y, float effect, float pits, String name) {
    itemgroups.add(new Item(x, y, effect, pits, name));
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
  String name;

  Item(int x, int y, float pointss, float effect, String nam)
  {
    ItemX = x;
    ItemY = y;
    points = pointss;    
    eff = effect;
    wid = img1.width;
    heig = img1.height;
    name = nam;
    isdead = false;
    len = 0;
    counter = 1;
    if(name == "bomb"){len = 2;}
    if(name == "coin"){len = 3;}
    if(name == "mushroom"){len = 2;}
    if(name == "gem"){len = 4;}
    if(name == "key"){len = 4;}
    
  }
  void show() {
    timer = timer + 1;
    if (timer == 10) {
      counter = counter + 1;
      timer = 0;
    }
    if (counter > len) {
      counter = 1;
    }
    appear = loadImage(name+str(counter)+".png");
    image(appear, ItemX, ItemY);
  }

  void iscatch() {
    if (points>0) {
      if (mousePressed == true) {
        if (playx <= ItemX+wid && playx>=ItemX && playy<= ItemY && playy>= ItemY-heig) {
          point = point + points;
          isdead = true;
          life = life + eff;
          if(name == "key"){
            nextlevel = true;
          }
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