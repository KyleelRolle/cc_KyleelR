// Click the stary sky to change the color of the cosmos !*!*!
// hover over the left side of the screen and a white square will appear 
// when the mood reaches the center of the screen the sun will rise



//sun and sky
float cirX = 60;
float cirY = 60;
float cirH = 500;
float skyG = 37;
float skyB = 88;

//stars
float starX = 1;
float starY = 1;

// moon
float moonX = 300;
float moonY = .1;



void setup(){
  size(1080, 500);
  background (42, 0,90);
}

void draw(){ 
  
 if(moonX > width/2){
    background (0,skyG,skyB);
    noStroke();
    fill (255,176,18);
    ellipse(540, cirH, cirX,cirY);
    
    cirX = cirX + .5;
    cirY = cirY + .5;
    cirH = cirH - .2;
    
    skyG = skyG + .5;
    skyB = skyB + .5;
    

   
 }else if (mouseX < width/2){
   background (255,0,0);
   
   rect(mouseX, mouseY, 50,50);
 
 }else if (!mousePressed){
   background (42, 0,90);
   starX = random(width);
   starY = random(height);
   noStroke();
   fill(255);
   ellipse(starX, starY, 6,6);
  //moon
  ellipse(moonX, 70, 20,20);
  moonX = moonX + 1;
  moonY = moonY + .1;

 }else if (mousePressed){
   background (0);
   starX = random(width);
   starY = random(height);
   noStroke();
   fill(starX, starY, 0);
   ellipse(starX, starY, 6,6);
   
  //moon
  ellipse(moonX, 70, 20,20);
  moonX = moonX + 1;
  moonY = moonY + .1;

 
 }
 
}   