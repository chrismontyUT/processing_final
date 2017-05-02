PImage img1 , img2 , img3 , img4;
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
  img1 = loadImage("level1.bmp");
  img2 = loadImage("level2.bmp"); 
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
  itemlevel1.addItem(830,560,1,0,"key");
  itemlevel1.addItem(200,220,1,0,"mushroom");
  itemlevel1.addItem(100,320,1,0,"mushroom");
  itemlevel1.addItem(40,475,1,0,"mushroom");
  itemlevel1.addItem(50,400,1,0,"mushroom");
  itemlevel1.addItem(550,100,1,0,"mushroom");
  itemlevel1.addItem(650,100,1,0,"mushroom");
  itemlevel1.addItem(750,100,1,0,"mushroom");
  itemlevel1.addItem(850,100,1,0,"mushroom");
  itemlevel1.addItem(800,360,1,0,"mushroom");
  itemlevel1.addItem(900,360,1,0,"mushroom");
  itemlevel1.addItem(380,810,1,0,"gem");
  itemlevel1.addItem(395,740,1,0,"gem");
  itemlevel1.addItem(410,670,1,0,"gem");
  itemlevel1.addItem(435,620,1,0,"gem");
  itemlevel1.addItem(480,560,1,0,"gem");
  itemlevel1.addItem(100,1000,1,0,"gem");
  itemlevel1.addItem(100,1050,1,0,"gem");
  itemlevel1.addItem(100,1100,1,0,"gem");
  itemlevel1.addItem(300,1200,1,0,"coin");
  itemlevel1.addItem(400,1200,1,0,"coin");

  itemlevel1.addItem(290,740,1,0,"bomb");
  itemlevel1.addItem(480,740,1,0,"bomb");
  itemlevel1.addItem(650,930,1,0,"gem");
  itemlevel1.addItem(759,1120,1,0,"coin");
  itemlevel1.addItem(799,1070,1,0,"coin");
  itemlevel1.addItem(839,1020,1,0,"coin");
  itemlevel1.addItem(1000,1200,1,0,"gem");
  itemlevel1.addItem(1100,1200,1,0,"gem");
  itemlevel1.addItem(1150,1200,1,0,"coin");
  itemlevel1.addItem(1050,1200,1,0,"coin");
  itemlevel1.addItem(1200,1200,1,0,"gem");
  itemlevel1.addItem(1470,1200,1,0,"gem");
  itemlevel1.addItem(1650,1100,1,0,"bomb");
  itemlevel1.addItem(1550,1100,1,0,"coin");
  
  itemlevel1.addItem(1190,360,1,0,"bomb");
  itemlevel1.addItem(2010,730,1,0,"bomb");
  itemlevel1.addItem(1380,820,1,0,"bomb");
  itemlevel1.addItem(1560,820,1,0,"mushroom");
  itemlevel1.addItem(1620,820,1,0,"mushroom");
  itemlevel1.addItem(1680,820,1,0,"mushroom");
  itemlevel1.addItem(1740,820,1,0,"mushroom");
  itemlevel1.addItem(1820,1200,1,0,"mushroom");
  itemlevel1.addItem(1920,1200,1,0,"mushroom");
  itemlevel1.addItem(1990,1200,1,0,"mushroom");
  itemlevel1.addItem(2060,1200,1,0,"mushroom");
  itemlevel1.addItem(2120,1200,1,0,"mushroom");
  itemlevel1.addItem(2180,1200,1,0,"mushroom");
  itemlevel1.addItem(2240,1200,1,0,"mushroom");
  itemlevel1.addItem(2300,1200,1,0,"mushroom");
  itemlevel1.addItem(2360,1200,1,0,"mushroom");
  itemlevel1.addItem(2200,1120,1,0,"mushroom");
  itemlevel1.addItem(2200,1040,1,0,"mushroom");
  itemlevel1.addItem(2200,960,1,0,"mushroom");
  itemlevel1.addItem(2200,880,1,0,"mushroom");
  itemlevel1.addItem(2200,800,1,0,"mushroom");
  itemlevel1.addItem(2280,750,1,0,"gem");
  itemlevel1.addItem(2280,680,1,0,"gem");
  itemlevel1.addItem(2280,610,1,0,"gem");
  itemlevel1.addItem(1920,450,1,0,"bomb");
  itemlevel1.addItem(1560,280,1,0,"mushroom");
  itemlevel1.addItem(1620,280,1,0,"mushroom");
  itemlevel1.addItem(1680,280,1,0,"mushroom");
  itemlevel1.addItem(1740,280,1,0,"mushroom");
  itemlevel1.addItem(1180,180,1,0,"mushroom");
  itemlevel1.addItem(1240,180,1,0,"mushroom");
  itemlevel1.addItem(1300,180,1,0,"mushroom");
  itemlevel1.addItem(1640,40,1,0,"gem");
  itemlevel1.addItem(1700,40,1,0,"gem");
  itemlevel1.addItem(1760,40,1,0,"gem");
  
  
  //itemlevel1.run();
  nextlevel = false;
}

void draw(){
  loadPixels();
  image(img1, 0,0);
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