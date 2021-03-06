class Protagonist { //<>// //<>// //<>// //<>// //<>// //<>//
  String collisionState;
  PImage[] images;
  PImage fall, stand, jump, duck;
  float fallVelocity = 2;
  float fallGravity = .4;
  int frame;
  int slow = 3;
  int xpos;//this is the top left corner of the sprite
  int ypos;//this is the top left corner
  PVector velocity;
  boolean falling;


  Protagonist() {
    images = new PImage[11];
    xpos = 0;
    ypos = 0;
    falling = false;
    for (int i=0; i<11; i++) {
      String filename = "p1_walk" + nf(i+1, 2) + ".png";
      images[i] = loadImage(filename);
    }
    fall = loadImage("alienGreen_swim1.png");
    stand = loadImage("p1_front.png");
    jump = loadImage("p1_jump.png");
    duck = loadImage("p1_duck.png");

    velocity = new PVector(0, 0);
  }
  void walk() {
    frame = (frame+1) % (11*slow);
    image(images[frame/slow], xpos, ypos+2);
    velocity.x += 1;

    if (velocity.x > 3)
      velocity.x = 3;

    xpos += velocity.x;
    println(xpos);
    println(velocity.x);
  }
  void walkBackwards() {
    scale(-1, 1);
    frame = (frame+1) % (11*slow);
    image(images[frame/slow], -xpos - 70, ypos+2);
    velocity.x -=1;

    if (velocity.x < -3)
      velocity.x = -3;

    xpos += velocity.x;
    if (xpos<0) {
      xpos = 0;
    }
  }
  void jump() {
    fallVelocity = -8;
    fall();
  }
  void duck() { 
    fallVelocity += 1;
    xpos += velocity.x;
    if (velocity.x>0)
    {
      image(duck, xpos, ypos+20);
    } else
    {
      scale(-1, 1);
      image(duck, -xpos-70, ypos+20);
    }
  }
  void stand() {
    image(stand, xpos, ypos+2);
  }
  void fall() {
    ypos += fallVelocity;
    fallVelocity += fallGravity;
    if (fallVelocity>3) {
      fallVelocity = 3;
    }
    xpos += velocity.x;
    if (xpos<0) {
      xpos = 0;
      velocity.x = -velocity.x;
    }

    if (velocity.x>0)
    {
      image(fall, xpos, ypos+2);
    } else
    {
      scale(-1, 1);
      image(fall, -xpos-70, ypos+2);
    }
  }

  public boolean canMove() {
    if (xpos < images[0].width) {
      if (xpos-velocity.x <0) {
        println(xpos);
        if (xpos<0) {
          xpos = 1;
          println("011");
          //velocity.x = abs(velocity.x);
        }
        velocity.x = abs(velocity.x);
        return false;
      }
      if (get(ypos+images[0].height, xpos) == color(0, 0, 0) && velocity.x >0) {
        fall();
        println("02");
        return false;
      } 
      else if (get(ypos+images[0].height, xpos+images[0].width) == color(0, 0, 0) && velocity.x<=0) {
        fall();
        println("022");
        return false;
      } 
      else if (get(ypos+images[0].height/2, xpos) != color(0, 0, 0) && velocity.x<=0) {
        fall();
        println("022");
        return false;
      } 
      else if (get(ypos+images[0].height/2, xpos+images[0].width) != color(0, 0, 0) && velocity.x>=0) {
        fall();
        println("023");
        return false;
      } 
      else {
        println("03");

        return true;
      }
    } else {
      if (velocity.x < 0 || keyCode == LEFT) {
        if (get(ypos+images[0].height, xpos+images[0].width) == color(0, 0, 0)) {
          fall();
          println(xpos);

          return false;
        }
        if (get(ypos+images[0].height/2, xpos) != color(0, 0, 0)) {
          stand();
          println("2");
          return false;
        }
      } else if (velocity.x >= 0 || keyCode == RIGHT) {
        if (get(ypos+images[0].height, xpos) == color(0, 0, 0)) {
          fall();
          println("3");
          return false;
        }
        if (get(ypos+images[0].height/2, xpos) != color(0, 0, 0)) {
          stand();
          stroke(255, 0, 0);
          fill(255, 0, 0);
          point(ypos+images[0].height/2, xpos-images[0].width/2);
          println(ypos);
          println(xpos);
          println("4");
          return false;
        }
      } else {
        return true;
      }
    }
    return true;
  }
  /*color testcolor = get(ypos+images[0].height+1, xpos+images[0].width/2);
   fill(testcolor);
   rect(20, 20, 20, 20);
   if (xpos<=images[0].width) {
   if(velocity.x>0){
   if (get(ypos+images[0].height, xpos) == color(0, 0, 0)
   }
   if (get(ypos+images[0].height, xpos) == color(0, 0, 0)&& get(ypos+images[0].height, xpos+images[0].width/2) == color(0, 0, 0)) {
   fall();
   return false;
   } else if (get(ypos+images[0].height/2, xpos) != color(0, 0, 0) && get(ypos+images[0].height/2, xpos+images[0].width) != color(0, 0, 0)) {
   println("ues");
   //if its a boundary wall, he should stand, not walk
   stand();
   return false;
   //if token- (he should grab it and walk)true
   //if enemy- (he should die) gameOver
   } else {
   //the protagonist is not blocked by an objects, he is standing on solid ground, so he can move
   return true;
   }
   } 
   else {
   if (get(ypos+images[0].height, xpos-images[0].width) == color(0, 0, 0) && get(ypos+images[0].height, xpos+images[0].width) == color(0, 0, 0)) {
   fall();
   return false;
   }
   //if colliding with an object, he needs to check what that object is
   //else if (pixels[width*(ypos+images[0].height/2)+xpos+images[0].width] != color(0, 0, 0)) {
   else if (get(ypos+images[0].height/2, xpos-images[0].width) != color(0, 0, 0) && get(ypos+images[0].height/2, xpos+images[0].width) != color(0, 0, 0)) {
   println("ues");
   //if its a boundary wall, he should stand, not walk
   stand();
   
   return false;
   //if token- (he should grab it and walk)true
   //if enemy- (he should die) gameOver
   } else {
   //the protagonist is not blocked by an objects, he is standing on solid ground, so he can move
   return true;
   }
   //location of his back
   //pixels[width*(ypos+images[0].height/2)+xpos] = color(255, 102, 204);
   //location of his top
   //pixels[width*(ypos-3)+xpos+images[0].width/2] == color(0,0,0);
   }
   }
   }
   */
}