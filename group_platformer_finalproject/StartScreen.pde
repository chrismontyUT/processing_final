PImage image_start_screen;

 

void init_start_menu() {
  image_start_screen = loadImage("StartMenu.jpeg"); 
}

void display_start_menu() {
  background(0);
  image(image_start_screen,0,0);
  

}