PImage image_instruction_screen;

void display_instructions() {
  image_instruction_screen = loadImage("instructionScreen.jpeg"); 
  background(0);
  image(image_instruction_screen,0,0);
}