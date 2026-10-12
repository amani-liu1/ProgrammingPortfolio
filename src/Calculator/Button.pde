class Button {
  // Member Variables
  float x, y, w, h;
  color c1, c2;
  char val;
  boolean hover;

  // Constructor
  Button(float x, float y,  char val) {
    this. x = x;
    this. y =y;
    w =40;
    h = 40;
    c1 = color(#989898);
    c2 = color(#CBCBCB);
    this. val = val;
    hover = false;
  }

  // Member Methods
  void display() {
    if(hover == true) {
    fill(c1);
    } else {
      fill(c2);
    }
    rectMode (CENTER);
    rect(x, y, w, h);
    fill(#030303);
    text(val, x, y);
  }

  void mouseOver (float tempX, float tempY) {
    if (tempX > x-w/2 && tempX < x+w/2 && tempY > y-h/2 && tempY < y+h/2) {
      hover =true;
    } else {
        hover= false ;
    }
  }
}
