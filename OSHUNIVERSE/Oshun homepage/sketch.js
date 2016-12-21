var rx = 0;
var ry = 0;
var rz = 0;

var r = 255;
var g = 255;
var b = 255;

var world;
var world4;
var oshun;
var vid;

var sel;

function preload() {
  world = loadImage("data/world3.jpg");
  world4 = loadImage("data/world4.jpg");
  oshun = loadImage("data/oshunhome.png");
  vid = createVideo(["data/oshunhome4.mp4"]);

}

function setup() {
  //for background video
  vid.loop();
  vid.hide();
  createCanvas(displayWidth, displayHeight, WEBGL);
  
 /*  textAlign(CENTER);
  background(0);
  sel = createSelect();
  sel.position(10, 10);
  sel.option('MEDIA');
  sel.option('TOUR');
  sel.option('HEALING');
  sel.option('SHOP');
  sel.option('BUILD');
  sel.changed(mySelectEvent);
*/
  
}


function draw() {


  noStroke();
  background(0);

  translate(0, 0, 0);

  //for background video
  texture(vid);
  plane(1600, 900);
  translate(0, 100, 0);
  
  
  if (mouseX > displayWidth/3 && mouseX < displayWidth/1.3) {
    rotateX(mouseY * 0.001);
    rotateY(mouseX * 0.01)

  }

  rotateY(frameCount * 0.003);
  rotateZ(frameCount * 0.00001);
  texture(world);
  sphere(120);

  rz = rz + .001;
  ry = ry + 0.01;
  rx = rx + 0.001;
  
}



/*function mySelectEvent() {
  var item = sel.value();
  background(200);
  text("it's a "+item+"!", 50, 50);
}
*/