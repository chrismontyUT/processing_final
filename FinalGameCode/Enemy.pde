class EnemyGroup{
  
  ArrayList<Spider> spider_group;

  EnemyGroup (){
          
      spider_group = new ArrayList<Spider>();

   }
   
   void addspider(float x_pos , float y_pos , float level , float range){
      spider_group.add(new Spider(x_pos , y_pos , level , range));
 }
   void enemy_run(){
     for(int i = 0; i< spider_group.size(); i++){
       Spider s = spider_group.get(i);
       println(s.range);
       s.walk2();
     }
   }
}

class Spider{
  PImage[] images;
  boolean direction = true;
  float spriteHeight = 0; 
  float spriteWidth = 0;
  int frame;
  int slow = 9;
  float x;
  float y;
  float level;
  float range;
  float original_x;
  
  Spider(float x_pos , float y_pos , float level_ ,float x_range){
    level = level_;
    x = x_pos;
    original_x = x_pos;
    y = y_pos;
    range = x_range;
    images = new PImage[2];
    for (int i=0; i<2; i++){
      String filename = "spider_walk" + nf(i+1,1) + ".png";
      images[i] = loadImage(filename);
    }
    spriteHeight= images[0].height;
    spriteWidth = images[0].width;
    
  }
  void walk(){
    frame = (frame+1) % (2*slow);
    if (frameCount % 240==0){
      direction = !direction;
    }
    if (direction){
      x -= .75;
      image(images[frame/slow], x + 500, y);
    }
    else{
      x += .75;
      
      pushMatrix();
      translate(x,0);
      scale(-1.0, 1.0);
      
      image(images[frame/slow], -images[0].width, y);
      popMatrix();

    }   
    
  }
  void walk2(){
    frame = (frame+1) % (2*slow);
    println(x , original_x , original_x - range);
    if ((x >= (original_x + range) )^( x <= (original_x - range))){
      direction = !direction;
      }
    if (direction){
      x -= .75;
      image(images[frame/slow] , x + 500, y);
    }
    else{
      x += .75;
      image(images[frame/slow], x + 500, y);

      }
    }
  }