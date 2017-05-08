PImage image_game_win;

void init_game_win() {
  image_game_win = loadImage("Win.jpeg"); 
}

void display_game_win_screen() {
  background(0);
  image(image_game_win, 0,0);
  fill(255);
  strokeWeight(4);
  textSize(32);
  text(str(point),985,613,200,50); 
}