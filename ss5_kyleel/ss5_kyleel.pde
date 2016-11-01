import processing.sound.*;
SoundFile file1;
SoundFile file2;
boolean playing1 = false;
boolean playing2 = false;
// ---------------------------------------------------------

// images
PImage bodega;
PImage bbox;
PImage bbox2;
// ---------------------------------------------------------

String state= "home";
// ---------------------------------------------------------

void setup() {
  size(700, 500);
  bodega = loadImage("bodega.jpg");
  bbox = loadImage ("bbox.png");
  bbox2 = loadImage ("bbox2.png");

  file1 = new SoundFile(this, "maloDRY.mp3");
  file2 = new SoundFile(this, "maloLIT.mp3");
    file1.play();

}

void draw() {

  if (state =="home") {
    image(bodega, 0, 0);
    image(bbox, 0, 0);
    fill(255, 0, 0);
    if ((mouseX > 440 && mouseX < 595) && (mouseY > 320 && mouseY < 410)) {
      image(bbox2, 0, 0);
    }

    textSize(20);
    fill(255);
    text ("EXIT", 620, 50);
    if (mouseX > 620 && mouseX < 660 && mouseY > 20 && mouseY < 70) {
      textSize(20);
      fill(255, 0, 0);
      text ("EXIT", 620, 50);
    }

  } else if (state =="exit") {
    background (0);
    file1.stop();
    file2.stop();
    
    textSize(20);
    fill(255);
    text ("ENTER", 80, 50);
    if (mouseX > 80 && mouseX < 150 && mouseY > 20 && mouseY < 70) {
      textSize(20);
      fill(255, 0, 0);
      text ("ENTER", 80, 50);
    }
    
  }
}
void mousePressed() {

  //Audio control----------------------------------------------
  if ((mouseX > 440 && mouseX < 595) && (mouseY > 320 && mouseY < 410)) {

    file1.stop();

    if (playing2) {
      file1.stop();
      file2.play();
    }

    if (playing2) {
      playing2 = true;
    } else {
      playing2 = false;
      file2.stop();
      file2.play();
    }
  }
  // ---------------------------------------------------------

  else if ((mouseX > 620 && mouseX < 660 && mouseY > 20 && mouseY < 70)) {
    state="exit";
  }
  
  else if ((mouseX > 80 && mouseX < 150 && mouseY > 20 && mouseY < 70)){
    state="home";
    file1.play();
  
  }
}