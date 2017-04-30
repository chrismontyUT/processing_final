Map levels[] = new Map[4];
Player player;
Spider spider;
EnemyGroup enemiesLevel1;
EnemyGroup enemiesLevel2;
EnemyGroup enemiesLevel3;
EnemyGroup enemiesLevel4;
int level = 1;

void setup() {
  surface.setResizable(true);
  size(1215, 675);
  player = new Player(1, 1, "player", 11);
  enemiesLevel1 = new EnemyGroup();
  enemiesLevel2 = new EnemyGroup();
  enemiesLevel3 = new EnemyGroup();
  enemiesLevel4 = new EnemyGroup();
  Table spider_list = loadTable("spiders.csv" , "header");
  for(TableRow row : spider_list.rows()){
    float table_level = row.getFloat("level");
    float x_pos = row.getFloat("x.pos");
    float y_pos = row.getFloat("y.pos");
    float x_range = row.getFloat("x_range");
    if(table_level == 1){
      enemiesLevel1.addspider(x_pos , y_pos , level , x_range);
    }
    else if (table_level == 2){
      enemiesLevel2.addspider(x_pos, y_pos , level , x_range);

    }
    else if (table_level == 3){
      enemiesLevel3.addspider(x_pos , y_pos , level , x_range);

    }
    else if (table_level == 4){
      enemiesLevel4.addspider(x_pos , y_pos , level , x_range);
    }
  }
  
  // Initialize each level in the levels array
  for(int i = 0; i < 4; i++) {
    levels[i] = new Map(27, 20);
  }
  // Load Tiles csv into each map
  Table tiles = loadTable("tiles.csv" , "header");
  for(TableRow row : tiles.rows()) {
    
    int level_num = row.getInt("level");
    int x_pos = row.getInt("x");
    int y_pos = row.getInt("y");
    // Add a metal tile where specified in the csv file
    levels[level_num-1].add_tile(x_pos , y_pos, 1); // (subtract 1 to match array index)
  }
}

void draw() { 
 // Set backgroud color to black
 background(0);
 // Display the map for the current level
 levels[level-1].display();
 // Set scaling to 0.5
 scale(0.5);
 // Update enemies for the current level
 enemiesLevel1.enemy_run();
 if(player.canMove()){
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
 }
 else {
  player.fallVelocity =0;
  player.stand();
  }
 }
//println("current x tile:" + (player.currentX_tile()) + "current y tile:" + (player.currentY_tile())); 

//println("tile below is metal?:" + map1.metal[player.currentX_tile()][player.currentY_tile() + 1]);
//println(player.can_fall());
//println(player.fallVelocity);

//println(player.playerY , player.overshoot());
//println(map1.bottom_right_of_player());

}