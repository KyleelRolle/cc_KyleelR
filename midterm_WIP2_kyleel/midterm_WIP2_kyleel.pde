import processing.video.*;
import processing.sound.*;
SoundFile file1;
SoundFile file2;
boolean playing1 = false;
boolean playing2 = false;

// ---------------------------------------------------------

Star[] stars = new Star[700];
float speed;

// ---------------------------------------------------------

float x = 0;

// ---------------------------------------------------------

String state= "home";

// images
PImage tittle;
PImage credits;
PImage eyesO;
PImage eyesC;
PImage ankh;
PImage ankhG;

PImage[] blankTape = new PImage [10];
int bt = 0;

// ---------------------------------------------------------

void setup() {
  size (700, 700);
  background(0);
  tittle = loadImage("t0.png");
  eyesO = loadImage ("eyesO.png");
  eyesC = loadImage ("eyesC.png");
  ankh = loadImage ("ankh.png");
  ankhG = loadImage ("ankhG.png");
  credits = loadImage("credits.png");

  blankTape[0]= loadImage ("blank50.jpg");
  blankTape[1]= loadImage ("blank51.jpg");
  blankTape[2]= loadImage ("blank52.jpg");
  blankTape[3]= loadImage ("blank53.jpg");
  blankTape[4]= loadImage ("blank54.jpg");
  blankTape[5]= loadImage ("blank55.jpg");
  blankTape[6]= loadImage ("blank56.jpg");
  blankTape[7]= loadImage ("blank57.jpg");
  blankTape[8]= loadImage ("blank58.jpg");
  blankTape[9]= loadImage ("blank59.jpg");

  file1 = new SoundFile(this, "pray.wav");
  file2 = new SoundFile(this, "prey.wav");
}

void flash() {
  imageMode(CENTER);
  image(blankTape[bt], width/2, height/2, 700, 700);
  bt=int(random(blankTape.length));
}

// ---------------------------------------------------------


void draw() {


  if (state =="home") {
    image(tittle, 0, 0);
    fill (0);
    rectMode(CENTER);
    rect (height/2, 600, 700, 50); 
    fill (255);
    textAlign(CENTER);
    textSize (15);
    text("click to start", width/2, 600);
  } else if (state=="game") {  // START OF THE GAME
    background(0);
    textSize (35);
    fill(255);
    text("PREY", 525, height/2);
    text("PRAY", 175, height/2);
    textSize (15);
    text("CHOOSE YOUR DESTINY", width/2, 600);

    if ((mouseX > 480 && mouseX < 570) && (mouseY > 320 && mouseY < 380)) {
      textSize (35);
      fill (255, 0, 0);
      text("PREY", 525, height/2);
    } else if ((mouseX > 120 && mouseX < 215) && (mouseY > 320 && mouseY < 380)) {
      textSize (35);
      fill (255, 0, 0);
      text("PRAY", 175, height/2);
    }
  } 
  if (state =="PRAY") {
    speed = map(mouseY, 0, width, 0, 10);
    background(0);


    //button to PREY ---- start
    fill(255);
    textSize (15);
    text ("PREY >", 600, 650);
    if (mouseY > 600 && mouseY < 670 && mouseX > 550 && mouseX < 630 ) {
      fill(120);
      textSize (15);
      text ("PREY >", 600, 650);
    }
    //button to PREY ---- end
    
    //Stars
    translate(width/2, height/2);
    for (int i = 0; i < stars.length; i++) {
      stars[i].update();
      stars[i].show();
    }
  } 
  if (state =="PREY") { 

    flash();
    imageMode(CENTER);
    image(eyesO, width/2, height/2, 700, 700);
    image(ankh, width/2, height/2, 700, 700);
    if (mouseY > 250 && mouseY < 380) {
      image(eyesC, width/2, height/2, 700, 700);
      image(ankh, width/2, height/2, 700, 700);
    }



    //button to PRAY ---- start
    fill(255);
    textSize (15);
    text ("< PRAY", 100, 650);
    if (mouseX > 70 && mouseX < 150 && mouseY > 600 && mouseY < 670) {
      fill(0);
      textSize (15);
      text ("< PRAY", 100, 650);
    }
    //button to PRAY ---- end
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

  else if ((mouseX > 120 && mouseX < 215) && (mouseY > 320 && mouseY < 380) || 
    (mouseX > 70 && mouseX < 150 && mouseY > 600 && mouseY < 670)) {
    state="PRAY";
    for (int i = 0; i < stars.length; i++) {
      stars[i] = new Star();
    }

    // music 

    file2.stop();

    if (playing1) {
      file2.stop();
      file1.play();
    }

    if (playing1) {
      playing1 = true;
    } else {
      playing1 = false;
      file1.stop();
      file1.play();
    }
  }

  // ---------------------------------------------------------
  else if ((mouseX > 480 && mouseX < 570) && (mouseY > 320 && mouseY < 380) || 
    (mouseY > 600 && mouseY < 670 && mouseX > 550 && mouseX < 630 )) {
    state="PREY";

    // music

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

  //end of code//
}