import processing.serial.*;

Serial port;

int[] input = {-1, -1};

void setup() {
  background(0);
  size(400, 400);
  println(Serial.list());
  port = new Serial(this, Serial.list()[2], 9600);
}

void draw() {

  //if (input[0] ==1) {
  //  background(255, 0, 255);
  //} else {
  //  background(0);
  //}
  //if (input[1]==1) {
  //  ellipse(width/2, height/2, 100, 100);
  //}

  if (input[0] == 0) {
    background (255, 255,255);
  }
  if (input[0] == 1) {
    background (255, 0, 0);
  }
  if (input[0] == 2) {
    background (255, 255, 0);
  }
  if (input[0] == 3) {
    background (0, 255, 255);
  }
  if (input[0] == 4) {
    background (255, 100, 0);
  }
  if (input[0] == 5) {
    background (100, 255, 0);
  }
  if (input[0] == 6) {
    background (200, 0, 255);
  }
}

void serialEvent(Serial port) {
  String inString = port.readStringUntil('\n'); 

  if (inString != null) {
    inString = trim(inString);
    String[] strInput = split(inString, ',');
    for (int i = 0; i <strInput.length; i++) {
      input[i] = int(strInput[i]);
    }
    println(input[0]);
    //println(input[1]);
    //println(inString);
  }
}