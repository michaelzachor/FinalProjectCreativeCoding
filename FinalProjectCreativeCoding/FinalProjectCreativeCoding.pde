PeopleFloor1[] person1 = new PeopleFloor1[25]; // array of people floor 1
PeopleFloor2[] person2 = new PeopleFloor2[25]; // array of people floor 2
int doorH; // door height
int pHeight; // person height
int pWidth;
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
int elevatorSpeed;
int elevatorSpeed_;
String elevatorAt;
int dF;
int oF;
int ready;
boolean check1[] = new boolean[25];
boolean check2[] = new boolean[25];
boolean inElevator1[] = new boolean[25];
boolean inElevator2[] = new boolean[25];
boolean stillIn1;
boolean stillIn2;
boolean onScreen1[] = new boolean[25];
boolean onScreen2[] = new boolean[25];
boolean jump[] = new boolean[25];
int points = 0;
int peopleGone = 0;

void setup() {
 // frameRate(30);
  size(500, 500);
  background(255);
  // define all the variables
  doorH = 125;
  pHeight = 40;
  pWidth = pHeight/2;
  doorPos1 = new PVector(width/2-3*doorH/8, height-doorH);
  doorPos2 = new PVector(width/4-3*doorH/8, height-doorH);
  doorPos1_ = new PVector(width/2-3*doorH/8, 3*height/4-doorH/2);
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
  elevatorFloor = 0;
  elevatorSpeed = 1;
  elevatorSpeed_ = 2;
  stillIn1 = false;
  stillIn2 = false;
  for (int i = 0; i < 25; i++) {
    person1[i] = new PeopleFloor1(i);
    person2[i] = new PeopleFloor2(i);
    check1[i] = false;
    check2[i] = false;
    inElevator1[i] = false;
    inElevator2[i] = false;
    jump[i] = true;
  }
}

void draw() {
  if (points >= 10){
    screen = 2;
    points = 0;
  }
  // start screen
  if (screen == 0) {
    textSize(32);
    fill(0);
    text("Click Space to Start", 100, height/4);
    textSize(25);
    text("Get the people to the floor whose color", 15, height/2);
    text("matches their color.", 15, height/2 + 25);
    text("Click on a door to open the elevator on", 15, height/2 + 50);
    text("that floor.", 15, height/2 + 75);
    text("Once you help 10 people make it to the", 15, height/2 + 100);
    text("floor of their color, you win!", 15, height/2 + 125);
  }
  // level 1 screen
  if (screen == 1) {
    numberOfFloors = 2;
    level1(doorPos1.x, doorPos1.y, doorH, height/2-doorH, doorPos1_.y);
    allElevatorStuff();
    allPersonStuff1(0);
    for (int j = 0; j < 24; j++) {
      if (check1[j] == true) {
        allPersonStuff1(j+1);
      }
    }
    allPersonStuff2(0);
    for (int j = 0; j < 24; j++) {
      if (check2[j] == true) {
        allPersonStuff2(j+1);
      }
    }
    
  }
  if (screen == 2) {
    background(255);
    textSize(32);
    fill(0);
    text("Nice job!", 100, height/4);
  }
}

void mouseClicked() {
  if (screen == 1) {
    //if you click on the first floor door
    if (mouseX >= doorPos1.x && mouseX <= doorPos1.x+3*doorH/4 && mouseY >= doorPos1.y && mouseY <= doorPos1.y+doorH) {
      if (elevatorFloor == 1) {
        elevatorAt = "first";
      }
      if (elevatorFloor == 2 || elevatorFloor == 0) {
        elevatorAt = "second_to_first";
      }
    }
    //second floor door
    if (mouseX >= doorPos1.x && mouseX <= doorPos1.x+3*doorH/4 && mouseY >= height/2-doorH && mouseY <= height/2) {
      if (elevatorFloor == 1 || elevatorFloor == 0) {
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
    if (screen == 0){
      screen++;
    }
  }
}

void level1(float doorX, float doorY, int doorHt, float doorY2, float doorY_) {
  lvl1.bg();
  lvl1.elevatorDoor(doorX, doorY, doorHt, color(175), color(0));
  lvl1.elevatorDoor(doorX, doorY2, doorHt, color(175), color(0));
  lvl1.elevator(doorX, doorY_, doorHt, color(150, 100, 200, a), color(150, 100, 200, a));
  lvl1.words();
}
