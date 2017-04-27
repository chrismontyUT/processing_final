PImage img;
float [][] spider_Positions = {{560,450}};
Protagonist protagonist;
Spider spider;
Laser laser;
boolean nextlevel;

ItemGroup itemlevel1;
void setup(){
  surface.setResizable(true);
  img = loadImage("level1.bmp");
  println(img.width);
  println(img.height);
  size(1230,680);
  protagonist = new Protagonist();
  spider = new Spider(spider_Positions[0]);
  //laser = new Laser(laser_Positions[0]);
  itemlevel1 = new ItemGroup();
  itemlevel1.addItem(400,500,1,0,"gem");
  itemlevel1.addItem(2200,100,1,0,"key");
  //itemlevel1.run();
  nextlevel = false;
}

void draw(){
  loadPixels();
  image(img, 0,0);
  scale(.5);
  spider.walk();
  if (protagonist.canMove()){
    if (keyPressed){
      if (key == CODED && keyCode == RIGHT){
        protagonist.fallVelocity =0;
        protagonist.walk();
      }
      if (key == CODED && keyCode == LEFT){
        protagonist.fallVelocity =0;
        protagonist.walkBackwards();
      }
      if (key == CODED && keyCode == UP){
        protagonist.fallVelocity =0;
        protagonist.jump();
      }
      if (key == CODED && keyCode == DOWN){
        protagonist.fallVelocity =0;
        protagonist.duck();
      }
    }
    else{
      protagonist.fallVelocity =0;
      protagonist.stand();
    } 
  }
  itemlevel1.run();
}