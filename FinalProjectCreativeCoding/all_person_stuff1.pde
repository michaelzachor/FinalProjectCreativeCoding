void allPersonStuff1(int m) {
  person1[m].enterFloor();
  person1[m].walkToElevator();
  if (elevatorAt == "first") { // if the elevator's at floor 1
    if (person1[m].xspeed == 0) { // and the person's not moving (standing in line)
      if (person1[m].posX >= doorPos1.x - pWidth && person1[m].posX < doorPos1.x){ // and he's first in line
        if (peopleInElevator < 4) { // and there's less than 4 people in the elevator
          person1[m].enterElevator();
          person1[m].peopleAhead = 0;
          person1[m+1].peopleAhead --;
        }
      } else { 
        if (person1[m].posX < doorPos1.x - pWidth*person1[m].peopleAhead){ 
          person1[m].xspeed = 2;
          person1[m].posX += person1[m].xspeed;
        } else { 
          person1[m].xspeed = 0;
        }
      }
    }
  }
  if (elevatorAt == "first_to_second") {
    if (inElevator1[m] == true) { // if he's in the elevator and it's going up, go up
      person1[m].goUp();
    }
  }
  if (elevatorAt == "second") {
    if (inElevator1[m] == true) { // if he's in the elevator and it's at the second floor, leave
      person1[m].exitElevator();
    }
  }
}
