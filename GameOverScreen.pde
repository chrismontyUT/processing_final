PImage image_game_over;

void init_game_over() {
  image_game_over = loadImage("Gameover.jpeg"); 
}

void display_game_over_screen() {
  background(0);
  image(image_game_over, 0,0);
}