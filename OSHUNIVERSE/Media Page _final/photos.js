function Photo(px, py) {

  this.x = px
  this.y = py

  this.display = function() {
    noStroke();
    noFill();
    image(photo1, this.x, this.y);
  }

}

// image(photo1,this.x,this.y);
// image(photo1,this.x,this.y);
// image(photo1,this.x,this.y);