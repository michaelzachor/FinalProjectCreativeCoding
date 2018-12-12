class Game {
  Game() {
  }
  void elevatorDoor(float l1_px, float l1_py, int l1_h, color l1_c, color s) {
    stroke(s);
    strokeWeight(4);
    fill(l1_c);
    rect(l1_px, l1_py, 3*(l1_h)/8, l1_h);
    rect(l1_px+(3*(l1_h)/8), l1_py, 3*(l1_h)/8, l1_h);
    stroke(0);
    line(0, l1_py+l1_h, width, l1_py+l1_h);
    strokeWeight(2);
    line(l1_px + 3*l1_h/16, l1_py + l1_h, l1_px + 3*l1_h/16, l1_py + height/numberOfFloors);
    line(l1_px + 9*l1_h/16, l1_py + l1_h, l1_px + 9*l1_h/16, l1_py + height/numberOfFloors);
  }
  void elevator(float l1_px, float l1_py, int l1_h, color l1_c, color s){
    stroke(s);
    strokeWeight(4);
    fill(l1_c);
    rect(l1_px, l1_py, 3*(l1_h)/8, l1_h);
    rect(l1_px+(3*(l1_h)/8), l1_py, 3*(l1_h)/8, l1_h);
  }

  void words() {
    textSize(20);
    fill(0);
    text("Level 1", 220, 20);
//    text("Elevator 1: ", 10, 20);
    //text("Floor 1: ",);
    //text("Floor 2: ");
    //text("Elevator 2: ");
    //text("Floor 1: ");
    //text("Floor 2: ");
//    text("Score: ", 10, 40);
//    text("Goal: ", 10, 60);
  }
}
