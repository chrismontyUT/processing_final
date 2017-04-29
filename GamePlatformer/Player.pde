class Player{
  
  int playerX;
  int playerY;
  int health = 10;
  PImage[] images;
  int imageCount;
  int frame;
  PImage fall, stand, jump, duck; 
  float fallVelocity = 2;
  float fallGravity = .4;
  int slow = 3;
  int xpos;//this is the top left corner of the sprite
  int ypos;//this is the top left corner
  PVector velocity;
  boolean falling;
  Player(int startX, int startY, String imagePrefix, int count)
  {
    playerX = startX;
    playerY = startY;
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into two digits
      String filename = imagePrefix + nf(i, 2) + ".png";
      images[i] = loadImage(filename);
    }
    fall = loadImage("alienGreen_swim1.png");
    stand = loadImage("p1_front.png");
    jump = loadImage("p1_jump.png");
    duck = loadImage("p1_duck.png");
    velocity = new PVector(0, 0);
  }
  
  int getPlayerX()
  {
    return playerX;
  }
  
  public int getPlayerY()
  {
    return playerY;
  }
  int currentX_tile(){
    return (playerX / 70);
  }
  int currentY_tile(){
    return (playerY / 70);
  }
  
  
   void walk() {
    frame = (frame+1) % (11*slow);
    image(images[frame/slow], playerX, playerY);
    velocity.x += 1;

    if (velocity.x > 3)
      velocity.x = 3;

    playerX += velocity.x;

    
  }
  
   void walkBackwards() {
    scale(-1, 1);
    frame = (frame+1) % (11*slow);
    image(images[frame/slow], -playerX - 70, playerY);
    velocity.x -=1;

    if (velocity.x < -3)
      velocity.x = -3;

    playerX += velocity.x;
    if (playerX<0) {
      playerX = 0;
    }
  }
  void jump() {
    fallVelocity = -8;
    fall();
  }
  void duck() { 
    fallVelocity += 1;
  //  playerX += velocity.x;      // why is this here??? this line moves him in the x direction while ducking
    if (velocity.x>0)
    {
      image(duck, playerX, playerY+20);
    } else
    {
      scale(-1, 1);
      image(duck, -playerX-70, playerY+20);
    }
  }
  void stand() {
    image(stand, playerX, playerY+2);
  }
  void fall() {
    playerY += fallVelocity;
    fallVelocity += fallGravity;
    if (fallVelocity>3) {
      fallVelocity = 3;
    }
    playerX += velocity.x;
    if (playerX<0) {
      playerX = 0;
      velocity.x = -velocity.x;
    }

    if (velocity.x>0)
    {
      image(fall, playerX, playerY+2);
    } else
    {
      scale(-1, 1);
      image(fall, -playerX-70, playerY+2);
    }
  }

  void display()
  {
    image(images[frame], playerX, playerY);
  }
  //public boolean canMove(){
    
  //}
    
}