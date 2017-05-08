float playx; //<>// //<>// //<>// //<>// //<>//
float playy;

void load_sounds() {
  sounds = new AudioPlayer[5];
  sounds[0] = MUS.loadFile("gem.wav", 2048);
  sounds[1] = MUS.loadFile("bomb.wav", 2048);
  sounds[2] = MUS.loadFile("coin.wav", 2048);
  sounds[3] = MUS.loadFile("mushroom.wav", 2048);
  sounds[4] = MUS.loadFile("key.wav", 2048);
}

class ItemGroup {
  ArrayList<Item> itemgroups;
  PVector origin;

  ItemGroup() {
    itemgroups = new ArrayList<Item>();
    //point = 0;
  }

  void addItem(int x, int y, int nameind) {


    itemgroups.add(new Item(x, y, nameind));
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
      //println("running");
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
  float timer;
  int lenofimg;
  String name;
  Item(int x, int y, int nameindex) {
    ItemX = x;
    ItemY = y;
    wid = player.images[0].width;
    heig = player.images[0].height;
    isdead = false;
    counter = 1;
    if (nameindex == 2) {
      lenofimg = 2;
      name = "bomb";
      eff = -2;
      points = -10;
    }     
    if (nameindex == 4) {
      lenofimg = 3;
      name = "coin";
      eff = 0;
      points = 5;
    }
    if (nameindex == 1) {
      lenofimg = 2;
      name = "mushroom";
      eff = 0.5;
      points = 2;
    }
    if (nameindex == 3) {
      lenofimg = 4;
      name = "gem";
      eff = 1;
      points = 10;
    }
    if (nameindex == 0) {
      lenofimg = 4;
      name = "key";
    }
    if (nameindex == 5) {
      lenofimg = 1;
      name = "door";
    }
    counter = int(random(1, lenofimg+1));
  }

  void show() {
    timer = timer + 1;
    if (timer == int(30/lenofimg)) {
      counter = counter + 1;
      timer = 0;
    }
    if (counter > lenofimg) {
      counter = 1;
    }
    if (lenofimg ==1 && gotkey == false) {
      appear = loadImage("door1.png");
      image(appear, ItemX, ItemY);
      appear = loadImage("door2.png");
      image(appear, ItemX, ItemY+70);
    }
    else if (lenofimg ==1 && gotkey == true) {
      appear = loadImage("door3.png");
      image(appear, ItemX, ItemY);
      appear = loadImage("door4.png");
      image(appear, ItemX, ItemY+70);
    } 
    else if (lenofimg !=1)  {
      appear = loadImage(name+str(counter)+".png");
      image(appear, ItemX, ItemY);
    }
    iscatch();
  }

  void iscatch() {
    if (playx+wid>= ItemX && playx<=ItemX+appear.width && playy <= ItemY+appear.height && playy+heig >= ItemY) {
      point = point + points;
      player.health = player.health + eff;
      if(player.health >=12){player.health = 12;}
      if(name != "door"){
              isdead = true;
            }
      this.play_sound();
      if (name == "key") {
        gotkey = true;
        isdead = false;
        ItemX = 2350;
        ItemY = 6; 
      }
      if(lenofimg ==1 && gotkey == true){
        if (level < 3){
                level = level + 1;
                gotkey = false;
              }
              else{
                is_game_win = true;
                is_game_over = true;
              }
        player.playerX = 0;
        player.playerY = 0;
      }
    }
  }

  void play_sound() { 
    if (name == "gem") { 
      sounds[0].rewind();
      sounds[0].play();
    } else if (name == "bomb") {
      sounds[1].rewind();
      sounds[1].play();
      ghosts.addGhost(player.playerX, player.playerY,player.images[0]);
    } else if (name == "coin") {
      sounds[2].rewind();
      sounds[2].play();
    } else if (name == "mushroom") {
      sounds[3].rewind();
      sounds[3].play();
    } else if (name == "key") {
      sounds[4].rewind();
      sounds[4].play();
    }
  }
}