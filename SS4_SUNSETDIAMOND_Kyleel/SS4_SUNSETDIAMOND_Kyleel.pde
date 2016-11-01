//Kyleel Rolle Pyramid Sunset
Diamond a;


void setup(){
  a = new Diamond();
size (1080,720, P3D);
background(245, 153, 178);
}

void draw(){

//sun
noStroke();
fill (211, 133, 32);
ellipse (540, 360, 320, 320);

// water 1
noStroke();
fill (35, 174, 227);
rect (0, 400, 1080,200);

// water 2
fill (35, 215, 229);
rect (0, 600, 1080,200);

//pyramid side 1
noStroke();
fill (227, 37, 87);
triangle(50, 850, 580, 350, 860, 850);
//pyramid side 2
fill (224, 160, 20);
triangle(300, 850, 580, 350, 1000, 850);

// this makes the OOP work
  a.display();
  a.move();




}