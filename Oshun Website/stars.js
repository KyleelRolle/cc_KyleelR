 var stars;



function setup() {
  //createCanvas(900, 900, WEBGL);
  createCanvas(displayWidth, displayHeight, WEBGL);
stars = loadImage("stars.jpg");
}

function draw() {
  image(stars);
}