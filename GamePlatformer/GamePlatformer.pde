import ddf.minim.*;//
AudioPlayer soundplayer;
AudioPlayer backgroundplayer;
Minim MUS;
boolean is_game_over;
Map levels[] = new Map[4];
EnemyGroup spider_group[] = new EnemyGroup[4];
Player player; //<>//
Spider spider;

// Keeps track of which keys are pressed because Processing can't do that nativley
boolean keys[] = new boolean[4];

int level = 1;
ItemGroup itemlevel[] = new ItemGroup[4];

float point;

void setup() {
  init_game_over();
  is_game_over = false;
  point = 0;
  frameRate(60);
  surface.setResizable(true);
  size(1215, 675);
  MUS = new Minim(this);
  backgroundplayer = MUS.loadFile("background.wav", 2048);
  backgroundplayer.loop();
  player = new Player(1, 1, "player", 11);


  for (int i = 0; i<4; i++) {
    spider_group[i] = new EnemyGroup();
  }
  for (int j = 0; j<4; j++) {
    itemlevel[j] = new ItemGroup();
    //print(j);
  }
 // setitems();
  Table spider_list = loadTable("spiders.csv", "header");
  for (TableRow row : spider_list.rows()) {
    int table_level = row.getInt("level");
    float x_pos = row.getFloat("x.pos");
    float y_pos = row.getFloat("y.pos");
    float x_range = row.getFloat("x_range");
    spider_group[table_level - 1].addspider(x_pos, y_pos, level, x_range);
  }

  // Initialize each level in the levels array
  for (int i = 0; i < 4; i++) {
    levels[i] = new Map(27, 20);
  }
  // Load Tiles csv into each map
  Table tiles = loadTable("tiles.csv", "header");
  for (TableRow row : tiles.rows()) {

    int level_num = row.getInt("level");
    int x_pos = row.getInt("x");
    int y_pos = row.getInt("y");
    // Add a metal tile where specified in the csv file
    levels[level_num-1].add_tile(x_pos, y_pos, 1); // (subtract 1 to match array index)
  }
  
  // Load Lasers csv into each map
  Table lasers = loadTable("lasers.csv" , "header");
  for(TableRow row : lasers.rows()) {
    
    int level_num = row.getInt("level");
    int x_pos = row.getInt("x");
    int y_pos = row.getInt("y");
    int dir = row.getInt("dir");
    int range = row.getInt("range");
    // Add a laser where specified in the csv file
    levels[level_num-1].add_laser(x_pos , y_pos, dir, range);
    
  }
  Table items = loadTable("items.csv" , "header");
  for(TableRow row : items.rows()){
    int x = row.getInt("x.pos");
    int y = row.getInt("y.pos");
    int id = row.getInt("index");
    itemlevel[level - 1].addItem(x,y,id);}
  
  // Load Switches csv into each map
  Table switches = loadTable("switches.csv" , "header");
  for(TableRow row : switches.rows()) {
    
    int level_num = row.getInt("level");
    int x_pos = row.getInt("x");
    int y_pos = row.getInt("y");
    // Add a laser where specified in the csv file
    levels[level_num-1].add_switch(x_pos , y_pos);
    
  }
}

void draw() { 
  if(!is_game_over) {
  // Set backgroud color to black
  background(0);
  // Display the map for the current level
  levels[level-1].display();
  // Set scaling to 0.5
  scale(0.5);
  // Update enemies for the current level
  spider_group[level - 1].enemy_run();
  itemlevel[level-1].run();
  if (player.canMove()) {
    player.numJumps = 0;
    if (keyPressed) {
      if (keys[0]) {
        //player.fallVelocity =0;
        player.walk();
      }
      if(keys[1]) {
        //player.fallVelocity =0;
        player.walkBackwards();
      }
      if(keys[2]) {
        player.fallVelocity =0;
        player.jump();
      }
      if(keys[3]) {
        player.fallVelocity =0;
        player.duck();
      }
    }
    else if (player.falling == false) {
      player.fallVelocity =0;
      player.stand();
    }
  } else {
    player.fall();
    if (keyPressed) {
      if (key == CODED && keyCode == RIGHT) {
        //player.fallVelocity =0;
        player.walk();
      }
      if (key == CODED && keyCode == LEFT) {
        //player.fallVelocity =0;
        player.walkBackwards();
      }
      if (key == CODED && keyCode == UP) {
        player.jump();
      } //<>// //<>//
    }
  } 
 if(player.touched_spider()){
   player.playerX = 1;
   player.playerY = 1;
   player.velocity.x = 0;
   player.velocity.y = 0;
   is_game_over = true;
 }
 if(levels[level-1].check_laser_collisions(player.get_corners())) {
   player.playerX = 1;
   player.playerY = 1;
   player.velocity.x = 0;
   player.velocity.y = 0;
   is_game_over = true;
 }
 } else {
   display_game_over_screen();
   //setup();
 }
}
 //<>// //<>//

void keyPressed() {
  if (key == CODED && keyCode == RIGHT) {
    keys[0] = true;
  }
  if (key == CODED && keyCode == LEFT) {
    keys[1] = true;
  }
  if (key == CODED && keyCode == UP) {
    keys[2] = true;
  }
  if (key == CODED && keyCode == DOWN) {
    keys[3] = true;
  }
}

void keyReleased() {
  if (key == CODED && keyCode == RIGHT) {
    keys[0] = false;
  }
  if (key == CODED && keyCode == LEFT) {
    keys[1] = false;
  }
  if (key == CODED && keyCode == UP) {
    keys[2] = false;
  }
  if (key == CODED && keyCode == DOWN) {
    keys[3] = false;
  }
}

void keyTyped() {
  if(key == ' ') {
    levels[level-1].space_pressed(player.get_corners());
    is_game_over = false;
    setup();
  }
}