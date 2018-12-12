class People {
  int posX = 0;
  float posY1 = height-pHeight;;
  float posY2 = height/2-pHeight;;
  int xspeed = 2;
  int yspeed = 2;
  int people1Change = 1;
  int people1Change_ = 1;
  int people2Change = 1;
  int peopleEChange = 1;
  int peopleEChange_ = 1;
  int r;
  int desiredFloor;
  int originalFloor;
  //boolean inElevator;
  People(int r_, int o_f, int d_f) {
    r = r_;
    desiredFloor = d_f;
    originalFloor = o_f;
  }

  void enterFloor() {
    if (originalFloor == 1) {
      
      noStroke();
      fill(255, 0, 0);
      ellipse(posX+pHeight/4, posY1, pHeight/2, pHeight/2);
      rect(posX, posY1, pHeight/2, pHeight);
      numberOfPeopleFloor1 += people1Change;
      people1Change = 0;
    } else if (originalFloor == 2) {
      
      noStroke();
      fill(255, 0, 0);
      ellipse(posX+pHeight/4, posY2, pHeight/2, pHeight/2);
      rect(posX, posY2, pHeight/2, pHeight);
      numberOfPeopleFloor2 += people2Change;
      people2Change = 0;
    }
  }

  void walkToElevator() {
    posX = posX + xspeed;
    if (originalFloor == 1) {
      if (posX > doorPos1.x - (pHeight/2)*(numberOfPeopleFloor1)) {
        xspeed = 0;
        check[r] = true;
      }
    } else if (originalFloor == 2) {
      if (posX > doorPos1.x - (pHeight/2)*(numberOfPeopleFloor2)) {
        xspeed = 0;
        check[r] = true;
      }
    }
  }

  void enterElevator() {
    if (frameCount% 30 == 0){
    println("PC1 = " + people1Change);
    }
    if (originalFloor == elevatorFloor) {
      if (xspeed == 0) {
        if (posX < doorPos1.x - pHeight/2) {
          xspeed = 2;
          posX = posX+xspeed;
        } else {
          xspeed = 0;
          if (peopleInElevator < 4) {
            if (stillIn == false){
            posX = int(doorPos1.x + (pHeight/2)*(peopleInElevator));
            inElevator[r] = true;
            peopleInElevator += peopleEChange;
            //println(peopleInElevator);
            peopleEChange = 0;
            numberOfPeopleFloor1 -= people1Change_;
            people1Change_ = 0;
            }
          } else {
            if (originalFloor == 1) {
              posX = int(doorPos1.x - (pHeight/2)*(numberOfPeopleFloor1));
            } else if (originalFloor == 2) {
              posX = int(doorPos1.x - (pHeight/2)*(numberOfPeopleFloor2));
            }
          }
        }
      }
    }
  }

  void goUp() {
//    println("posY = " + posY1);
//    println("posE = " + doorPos1_.y);
    stillIn = true;
    posY1 = doorPos1_.y + doorH - pHeight;
  }
  
  void goDown() {
    posY2 = doorPos1_.y + doorH - pHeight;
  }

  void exitElevator() {
    //println(stillIn);
    if (desiredFloor == elevatorFloor) {
      xspeed = 2;
      posX = posX + xspeed;
      if (posX > doorPos1.x + doorH/2 + pHeight/2){
        stillIn = false;
      } else {
        stillIn = true;
      }
      peopleInElevator -= peopleEChange_;
      peopleEChange_ = 0;
      if (posX > (width + pHeight/2)) {
        xspeed = 0;
      }
    }
  }
}
