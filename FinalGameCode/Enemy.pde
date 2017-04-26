class Enemy{
  
  PVector position_spider;
  PVector position_laser;
  boolean direction = true;
  float [][] Level_1_enemies = {{560,450},{0,200}};
  
  float spriteHeight = 0; 
  float spriteWidth = 0;
  PImage[] images;
  int frame;
  int slow = 9;
  
  Enemy (float[] position_){
    
    position_spider = new PVector(position_[0], position_[1]);
    position_laser = new PVector(position_[0], position_[1]);
  }
  //void kill(){
  //  background(255);
  //  text("GameOver", 0,0);
  //  noLoop();
  //}
  
}
class Spider extends Enemy{
  Spider(float[] position_spider){
    super(position_spider);
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
      position_spider.x -= .75;
      image(images[frame/slow], position_spider.x, position_spider.y);
    }
    else{
      position_spider.x += .75;
      
      pushMatrix();
      translate(position_spider.x,0);
      scale(-1.0, 1.0);
      
      image(images[frame/slow], -images[0].width, position_spider.y);
      popMatrix();

    }   
    
  }
  
}

class Laser extends Enemy{
  Laser(float[] position_laser){
    super(position_laser);
    
  }
}