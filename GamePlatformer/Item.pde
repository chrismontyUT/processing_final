float playx;
float playy;


class ItemGroup {
  ArrayList<Item> itemgroups;
  PVector origin;

  ItemGroup() {
    itemgroups = new ArrayList<Item>();
    //point = 0;
  }

  void addItem(int x, int y, String name) {
    itemgroups.add(new Item(x, y, name));
  }
  void update() {
    playx = player.playerX;
    playy = player.playerY;
  }

  void run() {
    update();
    for (int i = itemgroups.size()-1; i >= 0; i--) {
      Item p = itemgroups.get(i);
      p.show();
      println("running");
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
  float points;//for total points
  PImage appear;
  int index;
  boolean isdead;
  float eff;//for health
  int counter;
  float timer=0;
  int len;
  String name;

  Item(int x, int y, String nam)
  {
    ItemX = x;
    ItemY = y;
    wid = player.images[0].width;
    heig = player.images[0].height;
    name = nam;
    isdead = false;
    len = 0;
    counter = 1;
    if (name == "bomb") {
      len = 2;
      eff = -0.1;
      points = -1;
    }     

    if (name == "coin") {
      len = 3;
      eff = 0;
      points = 1;
    }
    if (name == "mushroom") {
      len = 2;
      eff = 0.01;
      points = 0;
    }
    if (name == "gem") {
      len = 4;
      eff = 0.1;
      points = 1;
    }
    if (name == "key") {
      len = 4;
    }
  }
  void show() {
    iscatch();
    timer = timer + 1;
    if (timer == 5) {
      counter = counter + 1;
      timer = 0;
    }
    if (counter > len) {
      counter = 1;
    }
    println(counter);
    appear = loadImage(name+str(counter)+".png");
    image(appear, ItemX, ItemY);
  }

  void iscatch() {
    if (points>0) {
      //playx+wid>= ItemX && playx<=ItemX+appear.width
      //playy <= ItemY+appear.height && playy+height >= ItemY
      if (playx+wid>= ItemX && playx<=ItemX+appear.width && playy <= ItemY+appear.height && playy+heig >= ItemY) {
        point = point + points;
        player.health = player.health + eff;
        isdead = true;
        soundplayer = MUS.loadFile(name+".wav", 2048);
        if (name == "key") {
          //  nextlevel = true;
        }
      }
    }
  }

}