var rx = 0;
var ry = 0;
var rz = 0;

var r = 255;
var g = 255;
var b = 255;

var img;
var stars;

function preload() {
  img = loadImage("world3.jpg");
  stars = loadImage("stars.jpg");
}

function setup() {
  //createCanvas(900, 900, WEBGL);
  createCanvas(displayWidth, displayHeight, WEBGL);

}

function draw() {
  noStroke();
 

  background(0);

  if (mouseX > 1920/4 && mouseX < 1920/2) {
    rotateX(mouseY * 0.001);
    rotateY(mouseX * 0.01)
  }

  rotateY(frameCount * 0.003);
  rotateZ(frameCount * 0.00001);
  texture(img);
  sphere(130,50,50);
  
  rz = rz + .001;
  ry = ry + 0.01;
  rx = rx + 0.001;

}