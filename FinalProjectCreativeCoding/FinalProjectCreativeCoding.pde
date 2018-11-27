PVector doorPos1;
PVector doorPos2;
PVector person;
int doorH;
int pHeight;
Game lvl1;
Game lvl2;
Game lvl3;
int numberOfFloors;
int screen;
int numberOfPeople;
float a;

void setup() {
  size(500, 500);
  background(255);
  a = 0;
  screen = 0;
  doorH = 125;
  pHeight = 40;
  doorPos1 = new PVector(width/2-3*doorH/8, height-doorH);
  doorPos2 = new PVector(width/4-3*doorH/8, height-doorH);
  person = new PVector(0, height-pHeight);
  lvl1 = new Game();
  lvl2 = new Game();
  lvl3 = new Game();
}

void draw() {
  if (screen == 0) {
    textSize(32);
    fill(0);
    text("Click Space to Start", 100, height/2);
  }
  if (screen == 1) {
    background(255);
    numberOfFloors = 2;
    level1(doorPos1.x, doorPos1.y, doorH, height/2-doorH);
    
  }
  if (screen == 2) {
    background(255);
    numberOfFloors = 3;
    level2(doorPos1.x, doorPos1.y, doorH, 2*height/3-doorH, height/3-doorH);
  }
  if (screen == 3) {
    background(255);
    level3(doorPos2.x, doorPos2.y, doorH, doorPos2.x + width/2, 2*height/3-doorH, height/3-doorH);
  }
}

void mouseClicked() {
  if (screen == 1) {
    if (mouseX >= doorPos1.x && mouseX <= doorPos1.x+3*doorH/4 && mouseY >= doorPos1.y && mouseY <= doorPos1.y+doorH){
      a = 255;
      person.x = doorPos1.x + 20*(numberOfPeople-1);
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    screen++;
  }
}

void level1(float doorX, float doorY, int doorHt, float doorY2) {
  lvl1.elevator(doorX, doorY, doorHt, color(175), color(0));
  lvl1.elevator(doorX, doorY2, doorHt, color(175), color(0));
  lvl1.elevator(doorX, doorY, doorHt, color(150, 100, 200, a), color(150, 100, 200, a));
  lvl1.people();
}

void level2(float doorX, float doorY, int doorHt, float doorY2, float doorY3) {
  lvl2.elevator(doorX, doorY, doorHt, color(175), color(0));
  lvl2.elevator(doorX, doorY2, doorHt, color(175), color(0));
  lvl2.elevator(doorX, doorY3, doorHt, color(175), color(0));
}

void level3(float doorX, float doorY, int doorHt, float doorX2, float doorY2, float doorY3) {
  lvl3.elevator(doorX, doorY, doorHt, color(175), color(0));
  lvl3.elevator(doorX, doorY2, doorHt, color(175), color(0));
  lvl3.elevator(doorX, doorY3, doorHt, color(175), color(0));
  lvl3.elevator(doorX2, doorY, doorHt, color(175), color(0));
  lvl3.elevator(doorX2, doorY2, doorHt, color(175), color(0));
  lvl3.elevator(doorX2, doorY3, doorHt, color(175), color(0));
}

class Game {
  Game() {
  }
  void elevator(float l1_px, float l1_py, int l1_h, color l1_c, color s) {
    stroke(s);
    strokeWeight(4);
    fill(l1_c);
    rect(l1_px, l1_py, 3*(l1_h)/8, l1_h);
    rect(l1_px+(3*(l1_h)/8), l1_py, 3*(l1_h)/8, l1_h);
    line(0, l1_py+l1_h, width, l1_py+l1_h);
    strokeWeight(2);
    line(l1_px + 3*l1_h/16, l1_py + l1_h, l1_px + 3*l1_h/16, l1_py + height/numberOfFloors);
    line(l1_px + 9*l1_h/16, l1_py + l1_h, l1_px + 9*l1_h/16, l1_py + height/numberOfFloors);
  }
  void people() {
    numberOfPeople = 1;
    if (person.x < doorPos1.x - (pHeight/2)*numberOfPeople) {
      noStroke();
      fill(255, 0, 0);
      ellipse(person.x+pHeight/4, person.y, pHeight/2, pHeight/2);
      rect(person.x, person.y, pHeight/2, pHeight);
      person.x += 2;
    } else {
      noStroke();
      fill(255, 0, 0);
      ellipse(person.x+pHeight/4, person.y, pHeight/2, pHeight/2);
      rect(person.x, person.y, pHeight/2, pHeight);
    }
    
  }
}
/*
text("Level 1");
 text("Elevator 1: ");
 text("Floor 1: ");
 text("Floor 2: ");
 text("Elevator 2: ");
 text("Floor 1: ");
 text("Floor 2: ");
 text("Score: ");
 text("Goal: ");
 */
