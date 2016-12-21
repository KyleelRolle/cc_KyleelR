var oneArt;
var button;
var one;

function preload() {
  oneArt = loadImage("data/0neArt.jpg");
  one = loadSound('data/0neruff.mp3');

}


function setup() {
  createCanvas(displayWidth, displayHeight);


  background(0);


  //Play button
  button = createButton("PLAY");
  button.position(displayWidth / 1.8, displayHeight / 1.5);
  button.mousePressed(Play)
    //button = createButton("PAUSE");
    //button.position(displayWidth / 1.8, displayHeight / 1.5);


  //Digital booklet Button
  button = createButton("DIGITAL BOOKLET");
  button.position(displayWidth / 1.64, displayHeight / 1.5);
  button.mousePressed(booklet)

}

function Play() {
  if (one.isPlaying()) { // .isPlaying() returns a boolean
    one.stop();
    //one.pause();

    background(0);
  } else {
    one.play();
    background(0);
  }

}

function booklet() {

}

function draw() {
  image(oneArt, displayWidth / 4, displayHeight / 3, oneArt.width / 3, oneArt.height / 3);

  fill(0);

  //bg behind text
  rect(displayWidth / 1.8, displayHeight / 3, 300, 300);

  //credits
  textSize(20);
  fill(255);
  text("0ne by OSHUN", displayWidth / 1.8, displayHeight / 2.30);
  fill(255);
  text("produced by Evil Needle", displayWidth / 1.8, displayHeight / 2.20);
  fill(255);
  text("add’l production by Proda", displayWidth / 1.8, displayHeight / 2.10);

  textSize(15);
  fill(255);
  text("written and arranged by OSHUN", displayWidth / 1.8, displayHeight / 1.90);
  fill(255);
  text("co written by Proda", displayWidth / 1.8, displayHeight / 1.84);


  textSize(10);

  fill(255);
  text("creative diretion by Proda", displayWidth / 1.8, displayHeight / 1.70);
  fill(255);
  text("© 2017 SunFlower Squad. All right reserved", displayWidth / 1.8, displayHeight / 1.66);
  //links
  fill(255, 199, 0);
  //text("PLAY           DIGITAL BOOKLET", displayWidth / 1.8, displayHeight / 1.5);



}