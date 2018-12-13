class PeopleFloor2 {
  int posX = 0;
  float posY2 = height/2-pHeight;
  int xspeed = 2;
  int yspeed = 2;
  int people2Change = 1;
  int people2Change_ = 1;
  int peopleEChange = 1;
  int peopleEChange_ = 1;
  int r;
  int peopleAhead;
  int wait;
  PeopleFloor2(int r_) {
    r = r_;
    peopleAhead = r - peopleGone;
  }
  void enterFloor() {
    onScreen2[r] = true;
    noStroke();
    fill(0, 0, 255);
    ellipse(posX+pHeight/4, posY2, pWidth, pWidth);
    rect(posX, posY2, pWidth, pHeight);
    numberOfPeopleFloor2 += people2Change;
    people2Change = 0;
  }

  void walkToElevator() {
    posX = posX + xspeed;
    if (posX >= doorPos1.x - (pWidth)*(numberOfPeopleFloor2)) {
      xspeed = 0;
      wait++;
      if (wait == 60){
      check2[r] = true;
      wait = 0;
      }
    }
  }

  void enterElevator() {
    if (stillIn1 == false){
            posX = int(doorPos1.x + (pWidth)*(peopleInElevator));
            inElevator2[r] = true;
            peopleInElevator += peopleEChange;
            peopleEChange = 0;
            numberOfPeopleFloor2 -= people2Change_;
            people2Change_ = 0;
          }
        }

  void moveForward() {
    if (posX < doorPos1.x - (pWidth)*(numberOfPeopleFloor1)) {
      xspeed = 2;
      posX = posX+xspeed;
    } else {
      xspeed = 0;
    }
  }

  void goDown() {
    stillIn2 = true;
    posY2 = doorPos1_.y + doorH - pHeight;
  }

  void exitElevator() {
    xspeed = 2;
    posX = posX + xspeed;
    if (posX > doorPos1.x + 3*doorH/4) {
      peopleInElevator -= peopleEChange_;
      peopleEChange_ = 0;
    }
    if (posX < width) {
      stillIn2 = true;
    } else {
      stillIn2 = false;
    }
    if (posX > 490 && posX < 500){
      posX = 501;
      points++;
    }
  }
}
