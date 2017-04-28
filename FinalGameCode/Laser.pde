class Laser{
  PImage blue_V = loadImage("laser_blue2.png");
  PImage blue_H = loadImage("laser_blue1.png");
  PImage blue_burst = loadImage("laser_blue3.png");
  PImage red_V = loadImage("laser_red2.png");
  PImage red_H = loadImage("laser_red1.png");
  PImage red_burst = loadImage("laser_red3.png");
  PImage green_V = loadImage("laser_green2.png");
  PImage green_H = loadImage("laser_gree1.png");
  PImage green_burst = loadImage("laser_green3.png");
  float spriteHeight = 0; 
  float spriteWidth = 0;
  float level;
  float x;
  float y;
  float range;
  float time;

  Laser(float x_pos , float y_pos , float level_ ,float time_ , float range_){
    level = level_;
    x = x_pos;
    y = y_pos;
    range = range_;
    time = time_;
  }
  
 
}