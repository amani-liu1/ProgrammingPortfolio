// Amani Liu | Sept 14 2026 | Calculator
// Color Palette #8D99B7 #B8AB8D #5D6578 #635A45 #1E2538

String displayVal = "0.0";
float l = 0.0;
float r = 0.0;
float result = 0.0;
char op = ' ';
boolean left = true;
boolean newEntry = true;

Button[] numButtons = new Button[10];
Button[] opButtons = new Button[13];

void setup() {
  size(300, 400);

  // number buttons
  numButtons[0] = new Button(50, 350, '0');
  numButtons[1] = new Button(50, 300, '1');
  numButtons[2] = new Button(110, 300, '2');
  numButtons[3] = new Button(170, 300, '3');
  numButtons[4] = new Button(50, 240, '4');
  numButtons[5] = new Button(110, 240, '5');
  numButtons[6] = new Button(170, 240, '6');
  numButtons[7] = new Button(50, 180, '7');
  numButtons[8] = new Button(110, 180, '8');
  numButtons[9] = new Button(170, 180, '9');

  // special buttons
  opButtons[0]  = new Button(230, 180, '+');
  opButtons[1]  = new Button(230, 240, '-');
  opButtons[2]  = new Button(230, 300, 'x');
  opButtons[3]  = new Button(230, 350, '÷');
  opButtons[4]  = new Button(170, 350, '=');
  opButtons[5]  = new Button(50, 120, 'C');
  opButtons[6]  = new Button(110, 350, '.');
  opButtons[7]  = new Button(110, 120, '±');
  opButtons[8]  = new Button(170, 120, 's'); // sqrt
  opButtons[9]  = new Button(230, 120, 'q'); // sq
  opButtons[10] = new Button(50, 70, ' ');
  opButtons[11] = new Button(110, 70, ' ');
  opButtons[12] = new Button(170, 70, ' ');
}

void draw() {
  background(240);
  updateDisplay();

  for (int i = 0; i < numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }

  for (int i = 0; i < opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].mouseOver(mouseX, mouseY);
  }
}

void updateDisplay() {
  rectMode(CENTER);
  fill(#FFFFFF);
  rect(150, 30, 200, 40, 100);

  fill(0);
  textAlign(RIGHT);
  text(displayVal, 220, 35);
}

void mouseReleased() {
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover) {
      String digit = str(numButtons[i].val);

      if (newEntry || displayVal.equals("0.0") || displayVal.equals("0")) {
        displayVal = digit;
        newEntry = false;
      } else {
        displayVal += digit;
      }

      if (left) {
        l = float(displayVal);
      } else {
        r = float(displayVal);
      }
    }
  }

  // operator clicfked buttons
  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].hover) {
      char clicked = opButtons[i].val;

      if (clicked == '=') {
        performCalc();
      } else if (clicked == '+' || clicked == '-' || clicked == 'x' || clicked == '÷' || clicked == '/') {
        op = clicked;
        left = false;
        newEntry = true;
        displayVal = str(op);
      } else if (clicked == '±') {
      } else if (clicked == 'C') {
        displayVal = "0.0";
        l = 0.0;
        r = 0.0;
        result = 0.0;
        op = ' ';
        left = true;
        newEntry = true;
      } else if (clicked == 's') { // square ropt
        if (left) {
          l = sqrt(l);
          displayVal = str(l);
        } else {
          r = sqrt(r);
          displayVal = str(r);
        }
      } else if (clicked == 'q') { // square
        if (left) {
          l = sq(l);
          displayVal = str(l);
        } else {
          r = sq(r);
          displayVal = str(r);
        }
      } else if (clicked == '.') {
        if (!displayVal.contains(".")) {
          displayVal += ".";
          if (left) {
            l = float(displayVal);
          } else {
            r = float(displayVal);
          }
        }
      }
    }
  }

  printState();
}


void printState() {
  println(
    "l: " + l +
    " | r: " + r +
    " | result: " + result +
    " | left: " + left +
    " | op: " + op +
    " | display: " + displayVal
    );
}

void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '/' || op == '÷') {
    if (r == 0) {
      displayVal = "ERROR";
      newEntry = true;
      return;
    }
    result = l / r;
  } else if (op == 'x' || op == '*') {
    result = l * r;
  } else {
    return;
  }

  displayVal = str(result);
  l = result;
  r = 0.0;
  left = true;
  newEntry = true;
}

void keyPressed () {
  if (key == '1') {
    println("YOU HIT 1 " + keyCode);
    handleEvent('1', true);
  }
}

void handleEvent(char val, boolean isNum) {
  if (isNum == true) {
    //stuff
  } else {
    //other stuff
  }
}
