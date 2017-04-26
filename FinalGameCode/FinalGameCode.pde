PImage img;
float [][] enemyPositions = {{560, 450}};
Protagonist protagonist;
Spider spider;
void setup(){
  surface.setResizable(true);
  img = loadImage("gravity_illustrator.bmp");
  size(700,560);
  protagonist = new Protagonist();
  spider = new Spider(enemyPositions[0]);

}

void draw(){
  loadPixels();
  image(img, 0,0);
  spider.walk();
  if (protagonist.canMove()){
    if (keyPressed){
      if (key == CODED && keyCode == RIGHT){
        protagonist.walk();
      }
      if (key == CODED && keyCode == LEFT){
        protagonist.walkBackwards();
      }
      if (key == CODED && keyCode == UP){
        protagonist.jump();
      }
      if (key == CODED && keyCode == DOWN){
        protagonist.duck();
      }
    }
    else{
      protagonist.stand();
    } 
  }
}