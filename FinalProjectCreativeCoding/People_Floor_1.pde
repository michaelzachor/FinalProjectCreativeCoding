class PeopleFloor1 {
  int posX = 0;
  float posY1 = height-pHeight;
  ;
  byte xspeed = 2;
  byte yspeed = 2;
  byte people1Change = 1;
  byte people1Change_ = 1;
  byte peopleEChange = 1;
  byte peopleEChange_ = 1;
  int r;
  int wait;
  int peopleAhead;
  PeopleFloor1(int r_) {
    r = r_;
    peopleAhead = r;
  }
  void enterFloor() {
    onScreen1[r] = true;
    // draw the guy
    noStroke();
    fill(255, 0, 0);
    ellipse(posX+pHeight/4, posY1, pWidth, pWidth);
    rect(posX, posY1, pWidth, pHeight);
    numberOfPeopleFloor1 += people1Change;
    people1Change = 0;
  }

  void walkToElevator() {
    posX = posX + xspeed;
    // once he reaches the end of the line/elevator, stop
    if (posX >= doorPos1.x - (pWidth)*(numberOfPeopleFloor1)) {
      xspeed = 0;
      wait++;
      if (wait == 30) {
        //new guy comes in
        check1[r] = true;
        wait = 0;
      }
    }
  }

  void enterElevator() {
    // once the blue people are off screen,
    if (stillIn2 == false) {
      //guy enters elevator.
      posX = int(doorPos1.x + (pWidth)*(peopleInElevator));
      inElevator1[r] = true;
      peopleInElevator += peopleEChange;
      peopleEChange = 0;
      numberOfPeopleFloor1 -= people1Change_;
      people1Change_ = 0;
    }
  }

  void goUp() {
    stillIn1 = true; 
    posY1 = doorPos1_.y + doorH - pHeight;
  }

  void exitElevator() {
    //go off screen
    xspeed = 2;
    posX = posX + xspeed;
    if (posX > doorPos1.x + 6*doorH/4) {
      peopleInElevator -= peopleEChange_;
      peopleEChange_ = 0;
    }
    //once he's off screen, the next people can get in the elevator
    if (posX < width) {
      stillIn1 = true;
    } else {
      stillIn1 = false;
    }
    //points
    if (posX > 490 && posX < 500) {
      posX = 501;
      points++;
    }
  }
}
