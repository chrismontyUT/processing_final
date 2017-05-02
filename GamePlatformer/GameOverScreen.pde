PImage image_game_over;

void init_game_over() {
  image_game_over = loadImage("GameOverScreen.jpg"); 
}

void display_game_over_screen() {
  background(0);
  image(image_game_over, 1215/2 - image_game_over.width/2, 675/2 - image_game_over.height/2);
}