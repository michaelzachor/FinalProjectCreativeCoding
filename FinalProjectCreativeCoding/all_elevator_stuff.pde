void allElevatorStuff(){
  // if the elevator is at floor 1, you can see the elevator
  if (elevatorAt == "first") {
    elevatorFloor = 1;
    doorPos1_.y = height-doorH;
    a = 255;
  }
  //if it's going up...
  if (elevatorAt == "first_to_second") {
    elevatorSpeed = 2;
    a = 100;
    doorPos1_.y = doorPos1_.y - elevatorSpeed;
    if (doorPos1_.y == height/2-doorH) {
      elevatorSpeed = 0;
      elevatorAt = "second";
    }
  }
  //if it's at floor 2
  if (elevatorAt == "second") {
    elevatorFloor = 2;
    doorPos1_.y = height/2-doorH;
    a = 255;
  }
  //if it's going down
  if (elevatorAt == "second_to_first") {
    elevatorSpeed = 2;
    a = 100;
    doorPos1_.y += elevatorSpeed;
    if (doorPos1_.y == height-doorH) {
      elevatorSpeed_ = 0;
      elevatorAt = "first";
    }
  }
}
