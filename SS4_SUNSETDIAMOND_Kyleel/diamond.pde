class Diamond {

  float x;
  float y;

  float rx= 0;
  float ry= 0;
  float rz= 0;
  
  Diamond() {
  
  x = width/2;
  y = height;
  
  }

  void display() {
    noStroke();
    directionalLight(255, 255, 255, 255, -1, 255);
    translate(width/2, width/2, 60);
    rotateX (mouseY*.001);
    rotateY (mouseX*.001);
    rotateZ(rz);
    box(100);
    
    rz = rz + .001;
    ry = ry + 0.01;
    rx = rx + 0.001;
  }

  void move() {
    y++;
  }

  void top() {
    
  }
}