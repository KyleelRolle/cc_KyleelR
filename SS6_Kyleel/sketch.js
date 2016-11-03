
var rx = 0;
var ry = 0;
var rz = 0;

var r = 255;
var g = 255;
var b = 255;

function setup() {
  createCanvas(800, 800, WEBGL);
}

function draw() {
  noStroke();
  directionalLight(255, g, b, -2, 1, 4);

  r = random(0);
  g = random(50);
  b = random(70);

  background(255);

  rotateX(mouseX * 0.01);
  rotateY(mouseY * 0.01);
  rotateZ(frameCount * 0.02)
  box(200, 200, 200);

  rz = rz + .001;
  ry = ry + 0.01;
  rx = rx + 0.001;

}