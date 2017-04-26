class Enemy{
  
  PVector position;
  boolean direction = true;

  float spriteHeight = 0; 
  float spriteWidth = 0;
  PImage[] images;
  int frame;
  int slow = 9;
  Enemy (float[] position_){
    
    position = new PVector(position_[0], position_[1]);
  }
  //void kill(){
  //  background(255);
  //  text("GameOver", 0,0);
  //  noLoop();
  //}
  
}
class Spider extends Enemy{
  Spider(float[] position_){
    super(position_);
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
      position.x -= .75;
      image(images[frame/slow], position.x, position.y);
    }
    else{
      position.x += .75;
      
      pushMatrix();
      translate(position.x,0);
      scale(-1.0, 1.0);
      
      image(images[frame/slow], -images[0].width, position.y);
      popMatrix();

    }
    
    
    
  }
  
}