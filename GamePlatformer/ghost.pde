class GhostGroup {
  ArrayList<ghost> ghostGroup;

  GhostGroup() {
    ghostGroup = new ArrayList<ghost>();
  }

  void addGhost(int x, int y, PImage body) {


    ghostGroup.add(new ghost(player.playerX,player.playerY,body));
  }

  void run() {
    for (int i = ghostGroup.size()-1; i >= 0; i--) {
      ghost p = ghostGroup.get(i);
      p.show();
      //println("running");
      if (p.isdead == true) {
        ghostGroup.remove(i);
      }
    }
  }
}


class ghost {

  int ItemX;
  int ItemY;
  int lifespam;
  PImage thebody;
  boolean isdead;
  float bodywid;
  float bodyheight;
  ghost(int x, int y,PImage body) {
    ItemX = x;
    ItemY = y-36;
    lifespam = 200;
    thebody = body;
    isdead = false;
    bodywid = body.width;
    bodyheight = body.height;
  }

  void show() {
    tint(255,0,0, lifespam+55);  // Display at half opacity
    image(thebody, ItemX,ItemY,bodywid,bodyheight);
    noTint();
    ItemX = ItemX + int(random(-3,3));
    ItemY = ItemY - 2;
    bodywid = bodywid - 0.3;
    bodyheight = bodyheight - 0.35;
    lifespam = lifespam - 1;
    if(lifespam == 0){
      isdead = true;
    }
  }

}