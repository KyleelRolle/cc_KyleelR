var oneArt;
var oneLogo;
var mpi;

var button;
var DbButton;
var Cbutton;

var one;
var fft;
var w;

var t;
var inc = 0.01;

var photos = []
var photo1;
var photo2;
var photo3;
var photo4;



function preload() {
  oneLogo = loadImage("data/0nelogo.png");
  mpi = loadImage("data/mpiB.jpg");
  one = loadSound('data/0neruff.mp3');
  photo1 = loadImage("data/photo1.png");
  photo2 = loadImage("data/photo2.png");
  photo3 = loadImage("data/photo3.png");
  photo4 = loadImage("data/photo4.png");

}


function setup() {
  createCanvas(displayWidth, displayHeight);
  fft = new p5.FFT(0.9, 256);
  w = displayWidth / 256

  filter = new p5.LowPass();
  analyzer = new p5.Amplitude();




  one.disconnect();
  one.connect(filter);
  analyzer.setInput(one);
  fft = new p5.FFT();

  t = 0;




  //PlayPause button
  button = createButton("PLAY");
  button.position(displayWidth / 1.25, displayHeight / 1.5);
  button.mousePressed(PlayPause)




  // //Digital booklet Button
  // DbButton = createButton("DIGITAL BOOKLET");
  // DbButton.position(displayWidth / 1.23, displayHeight / 1.5);
  // DbButton.mousePressed(booklet)

  /*  //Credits
    Cbutton = createButton("CREDITS");
    Cbutton.position(displayWidth / 1.12, displayHeight / 1.6);
    Cbutton.mousePressed(credits)*/


}

function PlayPause() {
  if (!one.isPlaying()) {
    one.play();
    button.html("STOP");
  } else {
    one.stop();
    button.html("PLAY");
  }

}




function booklet() {

var p = new Photo(width/2,height/2);
photos.push(p);

}


function draw() {
  background(0, 23, 52);
  image(mpi, 0, 0, mpi.width / 1.3, mpi.height / 1.3);
  image(oneLogo, displayHeight / 1.6,174, oneLogo.width / 2, oneLogo.height / 2);


  stroke(0, 18);
  noFill(255, 0, 0);
  var x1 = width * noise(t + 15);
  var x2 = width * noise(t + 25);
  var x3 = width * noise(t + 35);
  var x4 = width * noise(t + 45);
  var y5 = height * noise(t + 55);
  var y6 = height * noise(t + 65);
  var y7 = height * noise(t + 75);
  var y8 = height * noise(t + 85);

  bezier(x1, y5, x2, y6, x3, y7, mouseX, mouseY);

  t += 0.005;

  var rms = analyzer.getLevel();
  // ellipse(mouseX, mouseY, 10 + rms * 200, 10 + rms * 200)

  var r = 70;
  var g = 23;
  var b = 527;

  var spectrum = fft.analyze();
  for (var i = 0; i < spectrum.length; i++) {
    var amp = spectrum[i];
    var y = map(amp, 0, 200, height, 0);
    var y2 = map(amp, 0, 300, height, 0);
    var y3 = map(amp, 0, 400, height, 0);

    beginShape();
    stroke(254, 242, 53);
    point(i * w, y, width * w, height - y);

    stroke(106, 123, 174);
    point(i * w, y2, width * w, height - y);

    stroke(r, g, b);
    line(i * w, height, i * w, y3);

    r++;
    //g++;
    //b++;
  }
  endShape();


  filterFreq = map(mouseX, 0, width, 10, 22050);
  filterRes = map(mouseY, 0, height, 15, 5);
  filter.set(filterFreq, filterRes);

for (var ip = photos.length - 1; ip>=0; ip--){ 
  photos[ip].update();
  photos[ip].display();
}


  //credits
   noStroke()
   textSize(20);
   fill(255);
   text("0ne by OSHUN", displayWidth / 1.25, displayHeight / 2.25);
   fill(255);
   text("produced by Evil Needle", displayWidth / 1.25, displayHeight / 2.15);
   fill(255);
   text("add’l production by Proda", displayWidth / 1.25, displayHeight / 2.05);

   textSize(15);
   fill(255);
   text("written and arranged by OSHUN", displayWidth / 1.25, displayHeight / 1.85);
   fill(255);
   text("co written by Proda", displayWidth / 1.25, displayHeight / 1.79);

   textSize(10);

   fill(255);
   text("creative diretion by Proda", displayWidth / 1.25, displayHeight / 1.65);
   fill(255);
   text("© 2017 SunFlower Squad. All right reserved", displayWidth / 1.25, displayHeight / 1.61);
   

// image(oneArt, displayWidth / 4, displayHeight / 3, oneArt.width / 3, oneArt.height / 3);

//bg behind text
//fill(0);
//noStroke();
//rect(displayWidth / 1.8, displayHeight / 3, 300, 300);

}