import processing.video.*;

import processing.sound.*;
SoundFile file1;
SoundFile file2;
// ---------------------------------------------------------


Star[] stars = new Star[700];
float speed;

// ---------------------------------------------------------


float x = 0;

float nx = 0;
float ny = 0;

float r = 20;
float b = 240;
float g = 40;

// ---------------------------------------------------------

String state= "home";


// images
PImage tittle;
PImage credits;
PImage eyesO;
PImage eyesC1;


void setup() {
  size (700, 700);
  background(0);
  tittle = loadImage("t0.png");
  credits = loadImage("credits.png");
  eyesO = loadImage ("eyesO.png");
  eyesC1 = loadImage ("eyesC1.png");

  file1 = new SoundFile(this, "pray.wav");
  file2 = new SoundFile(this, "prey.wav");
}

// ---------------------------------------------------------

void draw() {

  textAlign(CENTER);
  textSize (15);

  if (state =="home") {
    image(tittle, 0, 0);
    fill (0);
    rectMode(CENTER);
    rect (height/2, 600, 700, 50); 
    fill (255);
    text("click to start", width/2, 600);
  } else if (state=="game") {  // START OF THE GAME
    background(0);
    textSize (35);
    fill(255);
    text("PRAY", 175, height/2);
    text("PREY", 525, height/2);
    textSize (15);
    text("CHOOSE YOUR DESTINY", width/2, 600);

    if (mouseX > width/2) {
      textSize (35);
      fill (255, 0, 0);
      text("PREY", 525, height/2);
    } else if (mouseX < width/2) {
      textSize (35);
      fill (255, 0, 0);
      text("PRAY", 175, height/2);
    }
  } else if (state =="PRAY") {
    speed = map(mouseY, 0, width, 0, 10);
    background(0, 1, 3);
    translate(width/2, height/2);
    for (int i = 0; i < stars.length; i++) {
      stars[i].update();
      stars[i].show();
    }
  } else if (state =="PREY") { 
    image(eyesO, 0, 0);
    if (mouseY < height/2) {
      image(eyesC1, 0, 0);
    }
  } 
  if (state=="reset") {
    background (0);
    textMode (CENTER);
    fill(255);
    textSize (15);
    text ("ALWAYS PRÆY", width/2, 500);
  }
} 






void mousePressed() {
  if (state=="home") {
    state="game";
  } 



  // ---------------------------------------------------------
  else if (mouseX < width/2) {
    state="PRAY";
    for (int i = 0; i < stars.length; i++) {
      stars[i] = new Star();
    }

    // music

    file1.play();
    file2.stop();




    // ---------------------------------------------------------
  } else if (mouseX > width/2) {
    state="PREY";


    // music

    file2.play();
    file1.stop();
  }
}
// ---------------------------------------------------------

//void keyPressed() {
//  if (state=="PRAY") {
//    state="reset";
//  }

//  if (state=="PREY") {
//    state="reset";
//  }
//}