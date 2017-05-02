class Overlay {
 
  PImage image_speaker;
  PImage image_muted;
  
  Overlay() {
    image_speaker = loadImage("SpeakerIcon.png");
    image_muted = loadImage("MuteIcon.png");
    image_speaker.resize(30, 30);
    image_muted.resize(30, 30);
  }
  
  void display_sound_icon(boolean muted) {
    if(muted) {
      image(image_muted, 0, 0);
    } else {
      image(image_speaker, 0, 0);
    }
  }
  
}