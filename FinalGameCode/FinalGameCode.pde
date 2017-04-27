PImage img;
float [][] spider_Positions = {{560,450}};
Protagonist protagonist;
Spider spider;
Laser laser;
void setup(){
  surface.setResizable(true);
  img = loadImage("level1.bmp");
  size(1230,680);
  protagonist = new Protagonist();
  spider = new Spider(spider_Positions[0]);
  //laser = new Laser(laser_Positions[0]);

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