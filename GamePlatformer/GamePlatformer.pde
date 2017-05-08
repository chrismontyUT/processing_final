PImage startscreen; //<>// //<>//
import ddf.minim.*;
AudioPlayer[] sounds;
AudioPlayer backgroundplayer;
Minim MUS;
Overlay overlay;
boolean muted;
boolean is_game_over;
boolean is_game_start;
boolean is_game_win;
Map levels[] = new Map[4];
EnemyGroup spider_group[] = new EnemyGroup[4];
Player player;
Spider spider;
boolean gotkey;
boolean touchingspider;
boolean touchinglaser;

// Keeps track of which keys are pressed because Processing can't do that nativley
boolean keys[] = new boolean[3]; //because there are only 3 inputs while playing

int level = 0;
ItemGroup itemlevel[] = new ItemGroup[4];
GhostGroup ghosts;
float point;
PFont font;

void setup() {
  init_game_over();
  is_game_over = false;
  point = 0;
  frameRate(60);
  surface.setResizable(true);
  size(1215, 675);
  MUS = new Minim(this);
  overlay = new Overlay();
  muted = false;
 /* startscreen = loadImage("start.jpg");
  image(startscreen, 0, 0, 1215, 675);
  font = createFont("font", 200, true);*/
  backgroundplayer = MUS.loadFile("background.wav", 2048);
  load_sounds();
  backgroundplayer.loop();
  reset();
}
void reset(){
  level = 1;
  point = 0;
  player = new Player(1, 1, "player", 11);
  ghosts = new GhostGroup();
  touchingspider = false;
  touchinglaser = false;
  for (int i = 0; i<4; i++) {
    spider_group[i] = new EnemyGroup();
  }
  for (int j = 0; j<4; j++) {
    itemlevel[j] = new ItemGroup();
  }
  gotkey = false;
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
  Table lasers = loadTable("lasers.csv", "header");
  for (TableRow row : lasers.rows()) {

    int level_num = row.getInt("level");
    int x_pos = row.getInt("x");
    int y_pos = row.getInt("y");
    int dir = row.getInt("dir");
    int range = row.getInt("range");
    // Add a laser where specified in the csv file
    levels[level_num-1].add_laser(x_pos, y_pos, dir, range);
  }
  Table items = loadTable("items.csv", "header");
  for (TableRow row : items.rows()) {
    int x = row.getInt("x.pos");
    int y = row.getInt("y.pos");
    int id = row.getInt("index");
    int itemlever = row.getInt("level");
    itemlevel[itemlever - 1].addItem(x, y, id);
  }

  // Load Switches csv into each map
  Table switches = loadTable("switches.csv", "header");
  for (TableRow row : switches.rows()) {

    int level_num = row.getInt("level");
    int x_pos = row.getInt("x");
    int y_pos = row.getInt("y");
    // Add a laser where specified in the csv file
    levels[level_num-1].add_switch(x_pos, y_pos);
  }
}

void draw() {
  if (!is_game_over) {
    if (level == 0) {
      textAlign(CENTER);
      fill(255);
      textSize(80);
      text("Insert Game Name Here", 607, 115);
      fill(#19CB20);
      rect(507, 155, 200, 75);
      textSize(40);
      fill(255);
      text("Start", 607, 205);
      if (mousePressed && mouseX>507 && mouseX <707 && mouseY>155 && mouseY <230) {
        println("The mouse is pressed and over the button");
        fill(#0E7C12);
        level += 1;
      }
    } else {
      // Set backgroud color to black
      background(0);
      // Display the map for the current level
      levels[level-1].display();
      int i = 0;
      fill(255, 255, 0);
      strokeWeight(4);
      textSize(26);
      text("Lifes:", 300, 35);
      while ( i<player.health) {
        image(player.star, 370+i*15, 6);
        i = i+2;
      }
      text("Points:"+int(point), 600, 35);
      overlay.display_sound_icon(muted);
      // Set scaling to 0.5
      scale(0.5);
      // Update enemies for the current level
      spider_group[level - 1].enemy_run();
      itemlevel[level-1].run();
      ghosts.run();
      if (player.canMove()) {
        boolean is_walking = false;
        player.numJumps = 0;
        if (keys[0]) {
          player.walk();
          is_walking = true;
        }
        if (keys[1]) {
          player.walkBackwards();
          is_walking = true;
        }
        if (keys[2]) {
        }
        if (player.falling == false) {
          player.fallVelocity =0;
          if (!is_walking) {
            player.stand();
          }
        }
      } else {
        player.fall();
        if (keys[0]) {
          player.walk();
        }
        if (keys[1]) {
          player.walkBackwards();
        }
      } 
      if (player.touched_spider() && touchingspider == false) {
        touchingspider = true;
        ghosts.addGhost(player.playerX, player.playerY, player.images[0]);
        player.health = player.health-2;
        //is_game_over = true;
      }
      if (player.touched_spider() == false && touchingspider == true) {
        touchingspider = false;
      }
      if (levels[level-1].check_laser_collisions(player.get_corners()) && touchinglaser == false) {

        touchinglaser = true;
        ghosts.addGhost(player.playerX, player.playerY, player.images[0]);
        player.health = player.health-3;
        //is_game_over = true;
      }
      if (levels[level-1].check_laser_collisions(player.get_corners()) == false && touchinglaser == true) {
        touchinglaser = false;
      }
      if (player.health <= 0) {
        is_game_over = true;
      } else {
        //display_game_over_screen();
      }
    }
  }
}


void keyPressed() {
  if (key == CODED && keyCode == RIGHT) {
    keys[0] = true;
  }
  if (key == CODED && keyCode == LEFT) {
    keys[1] = true;
  }
  if (key == CODED && keyCode == UP) {
    keys[2] = true;
    player.fallVelocity =0;
    player.jump();
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

void mouseClicked() {
  // Check if mute button is pressed
  if (mouseX <= 30 && mouseY <= 30) {
    if (muted) {
      muted = false;
      backgroundplayer.unmute();
      for (int i = 0; i < 5; i++) {
        sounds[i].unmute();
      }
    } else {
      muted = true;
      backgroundplayer.mute();
      for (int i = 0; i < 5; i++) {
        sounds[i].mute();
      }
    }
  }
}

void keyTyped() {
  if (key == ' ') {
    levels[level-1].space_pressed(player.get_corners());
    is_game_over = false;
    setup();
  }
}