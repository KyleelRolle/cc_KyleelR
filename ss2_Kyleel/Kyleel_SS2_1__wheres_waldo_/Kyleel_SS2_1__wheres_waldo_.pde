// Wheres Waldo
// start: ellipse mosaic in a specific color pallet (green hues) with one color that doesnt belong(red dot)
// click refresh / new color pallet 
// player must find the odd color and click it before it is burried in the dominant hues 



float circleX;
float circleY;

float circleX1;
float circleY1;

float x = 20;
float y = 20;

void setup(){
  size (1300,700);
  background(0);
}

void draw(){
  
  circleX = random(width);
  circleY = random(height);
  
  noStroke();
  fill(74);
  ellipse(circleX, circleY, 60,60);
    
}

void mousePressed() {
  
  background(0);
  
  circleX1 = random(width) + 1;
  circleY1 = random(height)+ 1;
  
 
 noStroke();
  fill (130);
  ellipse(circleX1, circleY1, 60, 60);
 
}

void keyPressed(){
  
noStroke();
  fill(234, 17,17);
  triangle(mouseX, mouseY,x,y,78,78);
  
}