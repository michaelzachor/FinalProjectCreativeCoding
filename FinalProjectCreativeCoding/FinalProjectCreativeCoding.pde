People[] person = new People[50]; // array of people
int doorH; // door height
int pHeight; // person height
PVector doorPos1; // level 1 bottom floor
PVector doorPos2; // level 2 bottom left floor
PVector doorPos1_; // level 1 purple open door
PVector personFloor1; // person start position bottom left corner
PVector personFloor2; // person start position second floor left
Game lvl1;
Game lvl2;
Game lvl3;
int numberOfFloors; // number of floors in the level
int screen;
int numberOfPeopleFloor1; // number of people on floor 1
int numberOfPeopleFloor2;
int peopleInElevator;
float a; // alpha of purple open door
int n;
int elevatorFloor; // what floor is the elevator on
//People p; // new person
int elevatorSpeed;
int elevatorSpeed_;
String elevatorAt;
int dF;
int oF;
int ready;
boolean check[] = new boolean[50];
boolean inElevator[] = new boolean[50];
boolean stillIn;

void setup() {
  size(500, 500);
  background(255);
  // define all the variables
  doorH = 125;
  pHeight = 40;
  doorPos1 = new PVector(width/2-3*doorH/8, height-doorH);
  doorPos2 = new PVector(width/4-3*doorH/8, height-doorH);
  doorPos1_ = new PVector(width/2-3*doorH/8, height-doorH);
  personFloor1 = new PVector(0, height-pHeight);
  personFloor2 = new PVector(0, height/2-pHeight);
  lvl1 = new Game();
  lvl2 = new Game();
  lvl3 = new Game();
  screen = 0;
  numberOfPeopleFloor1 = 0;
  numberOfPeopleFloor2 = 0;
  a = 0;
  n = 0;
  elevatorFloor = 1;
  //p = new People();
  elevatorSpeed = 2;
  elevatorSpeed_ = 2;
  for (int i = 0; i < 50; i++) {
    oF = int(random(1, 2.5));
    if (oF == 1) {
      dF = 2;
    } else {
      dF = 1;
    }
    person[i] = new People(i, oF, dF);
  }
  for (int i = 0; i < 10; i++) {
    check[i] = false;
    inElevator[i] = false;
  }
}

void draw() {
  if (frameCount % 30 == 0) {
    println("PF1 = " + numberOfPeopleFloor1);
    println("EF = " + elevatorFloor);
    //println("ready = " + ready);
    //println("Floor1P = " + numberOfPeopleFloor1);
    //println("ElvP = " + peopleInElevator);
  }
  // start screen
  if (screen == 0) {
    textSize(32);
    fill(0);
    text("Click Space to Start", 100, height/4);
    textSize(15);
    text("People on the 1st floor want to go upstairs, and vice versa.", 15, height/2);
    text("Click on a door to take the elevator there.", 15, height/2 + 15);
    text("Must start with 1st floor.", 15, height/2 + 30);
  }
  // level 1 screen
  if (screen == 1) {
    background(255);
    numberOfFloors = 2;
    level1(doorPos1.x, doorPos1.y, doorH, height/2-doorH, doorPos1_.y);
    allPersonStuff(0);
    for (int j = 0; j < 49; j++) {
      if (check[j] == true) {
        allPersonStuff(j+1);
        //println(j);
      }
    }
  }
}

void mouseClicked() {
  if (screen == 1) {
    if (mouseX >= doorPos1.x && mouseX <= doorPos1.x+3*doorH/4 && mouseY >= doorPos1.y && mouseY <= doorPos1.y+doorH) {
      if (elevatorFloor == 1) {
        elevatorAt = "first";
      }
      if (elevatorFloor == 2) {
        elevatorAt = "second_to_first";
      }
    }
    if (mouseX >= doorPos1.x && mouseX <= doorPos1.x+3*doorH/4 && mouseY >= height/2-doorH && mouseY <= height/2) {
      if (elevatorFloor == 1) {
        elevatorAt = "first_to_second";
      }
      if (elevatorFloor == 2) {
        elevatorAt = "second";
      }
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    screen++;
  }
}

void level1(float doorX, float doorY, int doorHt, float doorY2, float doorY_) {
  lvl1.elevatorDoor(doorX, doorY, doorHt, color(175), color(0));
  lvl1.elevatorDoor(doorX, doorY2, doorHt, color(175), color(0));
  lvl1.elevator(doorX, doorY_, doorHt, color(150, 100, 200, a), color(150, 100, 200, a));
  lvl1.words();
}

/*

 if (screen == 2) {
 background(255);
 numberOfFloors = 3;
 level2(doorPos1.x, doorPos1.y, doorH, 2*height/3-doorH, height/3-doorH);
 }
 if (screen == 3) {
 background(255);
 level3(doorPos2.x, doorPos2.y, doorH, doorPos2.x + width/2, 2*height/3-doorH, height/3-doorH);
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
 */
