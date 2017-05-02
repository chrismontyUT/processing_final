// Switches turn on and off lasers. The laser it turns off cooresponds to what order it is in in the csv file.

class Switch {
  
  int x, y;
  boolean on;
  PImage image_on, image_off;

  Switch(int x, int y) {
    this.x = x;
    this.y = y;
    on = true;
    image_on = loadImage("laserSwitchRedOn.png");
    image_off = loadImage("laserSwitchRedOff.png");
    image_on.resize(45, 45);
    image_off.resize(45, 45);
  }
  
  void display() {
    if(on) {
      image(image_on, x*45, y*45);
    } else {
      image(image_off, x*45, y*45);
    }
  }
  
  int get_x(){
    return x * 45 * 2; 
  }
  
  int get_y() {
    return y * 45 * 2;
  }
  
}