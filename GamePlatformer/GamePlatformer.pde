import ddf.minim.*;//
AudioPlayer soundplayer;
Minim MUS;
Map levels[] = new Map[4];
EnemyGroup spider_group[] = new EnemyGroup[4];
Player player;
Spider spider;
EnemyGroup enemiesLevel1;
EnemyGroup enemiesLevel2;
EnemyGroup enemiesLevel3;
EnemyGroup enemiesLevel4;
int level = 1;
ItemGroup itemlevel[] = new ItemGroup[4];

float point;

void setup() {
  point = 0;
  frameRate(60);
  surface.setResizable(true);
  size(1215, 675);
  MUS = new Minim(this);
  //soundplayer = MUS.loadFile("bgm.mp3", 2048);
  player = new Player(1, 1, "player", 11);
  enemiesLevel1 = new EnemyGroup();
  enemiesLevel2 = new EnemyGroup();
  enemiesLevel3 = new EnemyGroup();
  enemiesLevel4 = new EnemyGroup();
  for (int i = 0; i<4 ; i++){
    spider_group[i] = new EnemyGroup();
  }
  for (int j = 0; j<4 ; j++){ //<>//
    itemlevel[j] = new ItemGroup();
    println(j);
  }
  setitems();
  Table spider_list = loadTable("spiders.csv" , "header");
  for(TableRow row : spider_list.rows()){
    int table_level = row.getInt("level");
    float x_pos = row.getFloat("x.pos");
    float y_pos = row.getFloat("y.pos");
    float x_range = row.getFloat("x_range");
    spider_group[table_level - 1].addspider(x_pos,y_pos, level , x_range);
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
 spider_group[level - 1].enemy_run();
 itemlevel[level-1].run();
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
}

void setitems(){
  String[] itemtoload = loadStrings("items.csv");;
  int itemind= 1;
  String[] current;
  while(itemind<itemtoload.length){
    current = split(itemtoload[itemind],',');
    println(int(current[3]));
    println(current[0]);
    println(int(current[0])-1);
    int lev = int(current[0])-1;
    itemlevel[lev].addItem(int(current[2]),int(current[3]),current[1]); //<>//
    //itemgroups[0].addItem(int(current[2]),int(current[3]),current[1]);
    //itemgroups[int(current[0])].addItem(int(current[2]),int(current[3]),current[1]);
    itemind = itemind + 1;
  }

}