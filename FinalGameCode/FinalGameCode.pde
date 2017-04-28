PImage img;
Protagonist protagonist;
int Level = 1;
Spider spider;
boolean nextlevel;
EnemyGroup enemiesLevel1;
EnemyGroup enemiesLevel2;
EnemyGroup enemiesLevel3;
EnemyGroup enemiesLevel4;

ItemGroup itemlevel1;
void setup(){
  surface.setResizable(true);
  img = loadImage("level1.bmp");
 // println(img.width);
 // println(img.height);
  size(1230,680);
  protagonist = new Protagonist();
  enemiesLevel1 = new EnemyGroup();
  enemiesLevel2 = new EnemyGroup();
  enemiesLevel3 = new EnemyGroup();
  enemiesLevel4 = new EnemyGroup();
  Table spider_list = loadTable("spiders.csv" , "header");
  for(TableRow row : spider_list.rows()){
    float level = row.getFloat("level");
    float x_pos = row.getFloat("x.pos");
    float y_pos = row.getFloat("y.pos");
    float x_range = row.getFloat("x_range");
    if(level == 1){
      enemiesLevel1.addspider(x_pos , y_pos , level , x_range);
    }
    else if (level == 2){
      enemiesLevel2.addspider(x_pos, y_pos , level , x_range);

    }
    else if (level == 3){
      enemiesLevel3.addspider(x_pos , y_pos , level , x_range);

    }
    else if (level == 4){
      enemiesLevel4.addspider(x_pos , y_pos , level , x_range);
    }
   }
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
  if (Level == 1){
    enemiesLevel1.enemy_run();
  }
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