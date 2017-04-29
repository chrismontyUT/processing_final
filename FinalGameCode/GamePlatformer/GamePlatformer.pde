Map map1 , map2 , map3 , map4;
Player player;
Spider spider;
EnemyGroup enemiesLevel1;
EnemyGroup enemiesLevel2;
EnemyGroup enemiesLevel3;
EnemyGroup enemiesLevel4;
int level = 1;

void setup() {
  surface.setResizable(true);
  size(1230, 675);
  player = new Player(1, 1, "player", 11);
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
  
  map1 = new Map(27, 20);
  map2 = new Map(27,20);
  map3 = new Map(27,20);
  map4 = new Map(27,20);
  Table tiles = loadTable("tiles.csv" , "header");
  for(TableRow row : tiles.rows()){
    int level = row.getInt("level");
    int x_pos = row.getInt("x");
    int y_pos = row.getInt("y");
    if (level == 1){
      map1.add_tile(x_pos , y_pos);
    }
    else if (level == 2){
      map2.add_tile(x_pos, y_pos);
    }   
    else if (level == 3){
      map3.add_tile(x_pos, y_pos);
    }
    else if (level == 4){
      map4.add_tile(x_pos, y_pos);
    }
  }
}

void draw() { 
 background(0);
 if (level == 1){
    map1.display();
    scale(.5);
    enemiesLevel1.enemy_run();    
 }
 else if (level == 2){
   map2.display();
   scale(.5);
   enemiesLevel2.enemy_run();
 }
 
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
//println("current x tile:" + (player.playerX / 70) + "current y tile:" + (player.playerY / 70)); 
//println("tile below is metal?:" + map1.metal[player.playerX/70][(player.playerY/70)+1]);
for (int i = 0; i<27;i++){
  for(int j=0; j<20; j++){
    println("map["+ (player.playerX / 70)+ "][" + ((player.playerY / 70) + 1) + "]:" + map1.metal[i][j]);
    }


  }
}