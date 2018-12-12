void allPersonStuff(int m) {
  person[m].enterFloor();
  person[m].walkToElevator();
    
  if (elevatorAt == "first") {
    elevatorFloor = 1;
    doorPos1_.y = height-doorH;
    a = 255;
    if (inElevator[m] == false){
      person[m].enterElevator();
    }
    if (inElevator[m] == true){
      person[m].exitElevator();
    }
  }
  if (elevatorAt == "first_to_second") {
    elevatorSpeed = 1;
    a = 100;
    if(inElevator[m] == true){
      person[m].goUp();
    }
    doorPos1_.y = doorPos1_.y - elevatorSpeed;
    if (doorPos1_.y == height/2-doorH) {
      elevatorSpeed = 0;
      elevatorAt = "second";
    }
  }
  if (elevatorAt == "second") {
    elevatorFloor = 2;
    doorPos1_.y = height/2-doorH;
    a = 255;
    if (inElevator[m] == false){
      person[m].enterElevator();
    }
    if (inElevator[m] == true){
      person[m].exitElevator();
    }
  }
  if (elevatorAt == "second_to_first") {
    elevatorSpeed = -1;
    a = 100;
    if(inElevator[m] == true){
      person[m].goDown();
    }
    doorPos1_.y += elevatorSpeed_;
    if (doorPos1_.y == height-doorH){
      elevatorSpeed_ = 0;
      elevatorAt = "first";
    }
  }
    
}
