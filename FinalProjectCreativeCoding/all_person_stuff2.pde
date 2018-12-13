void allPersonStuff2(int mm) {
  person2[mm].enterFloor();
  person2[mm].walkToElevator();
    
  if (elevatorAt == "first") {
    if(inElevator2[mm] == true){
      person2[mm].exitElevator();
    }
  }
  if (elevatorAt == "second_to_first") {
    if (inElevator2[mm] == true) {
      person2[mm].goDown();
    }
  }
  if (elevatorAt == "second") {
    if (person2[mm].xspeed == 0) { // if he's not moving (is standing in line)
      if (person2[mm].posX >= doorPos1.x - pWidth && person2[mm].posX < doorPos1.x){
        if (peopleInElevator < 4) {
          if (stillIn1 == false){
          person2[mm].enterElevator();
          person2[mm].peopleAhead = 0;
          person2[mm+1].peopleAhead --;
        }
        }
      } else {
        if (person2[mm].posX < doorPos1.x - pWidth*person2[mm].peopleAhead){
          
          person2[mm].xspeed = 2;
          person2[mm].posX += person2[mm].xspeed;
        } else {
          person2[mm].xspeed = 0;
        }
      }
    }
  }
}
