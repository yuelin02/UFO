class CountDown {
  int msec, sec;
  boolean start;

  void draw() {
    textFont(titleItalic);
    if (!start) {
      sec = floor((millis()-msec)*.001);
      println(sec + "______________");
      
    } else {
      //fill(50, 150, 255);
      //rect(0, 0, width, height);
      
      textAlign(CENTER, CENTER);
      textSize(3*width/8);
      fill(255);
      text("GO!!!", width/2, height/2);
      
      println("GO");   
      gameState = 2;
      count.reset();
    }
  } 

  void readyStart() {
    ////seconds////
    if (sec == 4) {
        start = true;
      }
    if (sec == 3) {
      fill(255);
      textSize(3*width/8);
      textAlign(CENTER, CENTER);
      text("1", width/2, height/2);
      println("1");
    }
    if (sec == 2) {
      fill(255);
      textSize(2*width/8);
      textAlign(CENTER, CENTER);
      text("2", width/2, height/2);
      println("2");
    }
    if (sec == 1) {
      fill(255);
      textSize(width/8);
      textAlign(CENTER, CENTER);
      text("3", width/2, height/2);
      println("3");
    }
  }
  
  void reset(){
    count.msec = millis();
    count.start = false;
  }

  //  void mouseClicked() {
  //    //countdown again first resetting the "now" time and start var
  //    msec = millis();
  //    start = false;
  //  }
}