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



function preload() {
  oneLogo = loadImage("data/0nelogo.png");
  mpi = loadImage("data/mpiB.jpg");

  one = loadSound('data/0neruff.mp3');
}


function setup() {
  createCanvas(displayWidth, displayHeight);
  fft = new p5.FFT(0.9, 256);
  w = displayWidth / 256

  filter = new p5.LowPass();



  one.disconnect();
  one.connect(filter);


  fft = new p5.FFT();

  t = 0;




  //PlayPause button
  button = createButton("PLAY");
  button.position(displayWidth / 1.31, displayHeight / 1.6);
  button.mousePressed(PlayPause)




  //Digital booklet Button
  DbButton = createButton("DIGITAL BOOKLET");
  DbButton.position(displayWidth / 1.245, displayHeight / 1.6);
  DbButton.mousePressed(booklet)

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


}


function draw() {
  background(0, 23, 52);
  image(mpi, 0, 0, mpi.width / 1.3, mpi.height / 1.3);
  image(oneLogo, displayHeight / 1.3, 100, oneLogo.width / 1.9, oneLogo.height / 1.9);








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

}



/*
  //credits
   noStroke()
   textSize(20);
   fill(255);
   text("0ne by OSHUN", displayWidth / 1.3, displayHeight / 2.25);
   fill(255);
   text("produced by Evil Needle", displayWidth / 1.3, displayHeight / 2.15);
   fill(255);
   text("add’l production by Proda", displayWidth / 1.3, displayHeight / 2.05);

   textSize(15);
   fill(255);
   text("written and arranged by OSHUN", displayWidth / 1.3, displayHeight / 1.85);
   fill(255);
   text("co written by Proda", displayWidth / 1.3, displayHeight / 1.79);

   textSize(10);

   fill(255);
   text("creative diretion by Proda", displayWidth / 1.3, displayHeight / 1.65);
   fill(255);
   text("© 2017 SunFlower Squad. All right reserved", displayWidth / 1.3, displayHeight / 1.61);
   
*/
// image(oneArt, displayWidth / 4, displayHeight / 3, oneArt.width / 3, oneArt.height / 3);

//bg behind text
//fill(0);
//noStroke();
//rect(displayWidth / 1.8, displayHeight / 3, 300, 300);