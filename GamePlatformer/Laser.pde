class Laser {
  
  int x, y;
  int range;
  // Direction:
  // 0=right, 1=left
  int dir;
  boolean on = true;
  PImage gun;
  PImage beam;

  Laser(int x, int y, int dir, int range) {
    this.x = x;
    this.y = y;
    this.dir = dir;
    this.range = range;
    
    // Load correct image depending on which way it's facing
    if(dir == 0) {
      gun = loadImage("laserRight.png");
    } else if (dir == 1) {
      gun = loadImage("laserLeft.png");
    }
    
    if(dir == 0 || dir == 1) {
      beam = loadImage("laserRedHorizontal.png");
    }
    
    gun.resize(45, 45);
    beam.resize(45, 45);
    
  }
  
  // Turn on/off the laser
  void toggle() {
    on = !on; 
  }
  
  // Used for collision checking
  int get_x() {
    return x * 45 * 2;
  }
  
  // Used for collision checking. Includes range of laser beam.
  int get_y() {
    return y * 45 * 2;
  }
  
  // Used for collision checking
  int get_end() {
    return (y + 45 + range * 45) * 2;
  }
  
  void display() {
    //println("displaying");
    image(gun, x*45, y*45);
    // Shooting right
    if(dir == 0) {
       for(int i = 0; i < range; i++) {
         image(beam, 45 + x*45 + i * 45, y*45); 
       }
    }
    
  }
  
}