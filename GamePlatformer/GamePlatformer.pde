Map map;
Player player;
Spider spider;

void setup() {
  size(1230, 675);
  player = new Player(1, 4, "player", 11);
  map = new Map(20, 20);
}

void draw() { 
  background(0);
  map.display();
 scale(.5);
 if (keyPressed){
  if (key == CODED && keyCode == RIGHT) {
    player.fallVelocity =0;
    player.walk();
  }
  if (key == CODED && keyCode == LEFT) {
    player.fallVelocity =0;
    player.walkBackwards();
  }
  if (key == CODED && keyCode == UP) {
    player.fallVelocity =0;
    player.jump();
  }
  if (key == CODED && keyCode == DOWN) {
    player.fallVelocity =0;
    player.duck();
  }
 }else {
  player.fallVelocity =0;
  player.stand();
} 

}