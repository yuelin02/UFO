import processing.video.*;
import ddf.minim.*;
import processing.serial.*;


//int[] input = {-1,-1};
int input;
Serial port;
int sensors;
int state = 0;
int gameState = 0;
int currentLevel = 0;
int lives = -1;

Minim minim;
//PImage bg0, bg1, bg2, bg3, bg4, bg5, bg6, bg7, bg8, bg9, bg10, bg11;
PImage bg0, bg1, bg2, bg3;
PFont[] fontList = new PFont[3];
Movie introMovie;
String[] nameOfColors = {"ORANGE", "GREEN", "PURPLE", "BLUE", "YELLOW", "RED"};

color[] myColors = {color(255, 0, 0), color(255, 255, 0), color(0, 0, 255), color(255, 165, 0), 
  color(0, 255, 0), color(160, 32, 240)};
AudioPlayer bgMusic, hitMusic, nextMusic, yesMusic;


PFont font;

float x = random(0, 5);
int y = int(x);
float a = random(0, 5);
int b = int(a);
int old_y = -1;
float c = random(0, 2);
int d = int(c);

Timer timer;

//red = 1;
//yellow = 2;
//blue = 3;
//orange =4;
//green = 5;
//purple = 6;

//String names = nameOfColors[(int)random(0,5)];
//color myColor = myColors[(int) random(0,5)];


void setup() {
  println(Serial.list());
  port = new Serial(this, Serial.list()[1], 115200);
  port.bufferUntil('\n');

  background (0);
  //size(1000, 600);
  fullScreen();
  //frameRate(2);

  fontList[0] = createFont("Minimoon.ttf", 2);
  fontList[1] = createFont("Heartache.ttf", 2);
  fontList[2] = createFont("sketches font.ttf", 2);
  //fontList[3] = createFont("Prisma.ttf", 2);
  //fontList[4] = createFont("Prisma.ttf", 2);
  //fontList[5] = createFont("5x5_pixel.ttf", 2);

  minim = new Minim(this);
  bgMusic= minim.loadFile("tricks.mp3", 1024);
  hitMusic= minim.loadFile("bounce.mp3", 1024);
  nextMusic= minim.loadFile("jump.mp3", 1024);
  yesMusic = minim.loadFile("yes.mov", 1024);

  //bg0 = loadImage("bg0.png");
  //bg1 = loadImage("bg1.png");
  //bg2 = loadImage("bg2.png");
  //bg3 = loadImage("bg3.png");
  //bg4 = loadImage("bg4.png");
  //bg5 = loadImage("bg5.png");
  //bg6 = loadImage("bg6.png");
  //bg7 = loadImage("bg7.png");
  //bg8 = loadImage("bg8.png");
  //bg9 = loadImage("bg9.png");
  //bg10 = loadImage("bg10.png");
  //bg11 = loadImage("bg11.png");

  bg0 = loadImage("bg0.png");
  bg1 = loadImage("bg1.png");
  bg2 = loadImage("bg8.png");
  bg3 = loadImage("bg11.png");


  introMovie = new Movie(this, "intro.mov");

  timer= new Timer();
}


void draw() {
  background(0);

  switch (gameState) {
  case 0:
    titleState();  
    bgMusic.play();
    println("case0, y value: "+y);
    break; 

  case 1:
    introState();
    fill(255);
    textFont(fontList[2]);
    textSize(35);
    text("Press mouse to skip", width/8, 100);
    break;

  case 2:
    //image(bg1, 0, 0, width, height);
    //background(255, 239, 211);
    timer.start();
    gamePlay();
    showScore();
    println("case1, y value: "+y);

    if ((sensors-1) == y) {
      old_y = y;
      generateNextRandomY();
      lives++;
      gameState++;
      //yesMusic.rewind();
      println("R is here");
    } else if ((sensors-1) != y && sensors !=0) {
      nextMusic.play();
      nextMusic.rewind();
      println("music on");
    }
    //nextMusic.close();
    break;

  case 3:
    //image(bg2, 0, 0, width, height);
    //background(208, 236, 234);
    gamePlay();
    showScore();
    println("case2, y value: "+y);

    if ((sensors-1) == y) {
      old_y = y;
      generateNextRandomY();
      lives++;
      gameState++;
      println("R is here");
    } else if ((sensors-1) != y  && sensors !=0) {
      nextMusic.play();
      nextMusic.rewind();
      println("music on");
    }
    //nextMusic.close();
    break;


  case 4:
    //image(bg3, 0, 0, width, height);
    //background(159, 214, 210);
    gamePlay();
    showScore();
    println("case3, y value: "+y );

    if ((sensors-1) == y) {
      old_y = y;
      generateNextRandomY();
      lives++;
      gameState++;
      println("R is here");
    } else if ((sensors-1) != y) {
      nextMusic.play();
      nextMusic.rewind();
      println("music on");
    }

    //nextMusic.close();
    break;


  case 5:
    //image(bg4, 0, 0, width, height);
    //background(255, 216, 216);
    gamePlay();
    showScore();
    println("case4, y value: "+y );

    if ((sensors-1) == y) {
      old_y = y;
      generateNextRandomY();
      lives++;
      gameState++;
      println("R is here");
    } else if ((sensors-1) != y) {
      nextMusic.play();
      nextMusic.rewind();
      println("music on");
    }
    nextMusic.close();
    break;


  case 6:
    //image(bg5, 0, 0, width, height);
    //background(248, 218, 251);
    gamePlay();
    showScore();
    println("case5, y value: "+y );

    if ((sensors-1) == y) {
      old_y = y;
      generateNextRandomY();
      lives++;
      gameState++;
      println("R is here");
    } else if ((sensors-1) != y) {
      nextMusic.play();
      nextMusic.rewind();
      println("music on");
    }
    nextMusic.close();
    break;


  case 7:
    //image(bg6, 0, 0, width, height);
    //background(255, 254, 228);
    gamePlay();
    showScore();
    println("case6, y value: "+y );

    if ((sensors-1) == y) {
      old_y = y;
      generateNextRandomY();
      lives++;
      gameState++;
      println("R is here");
    } else if ((sensors-1) != y) {
      nextMusic.play();
      nextMusic.rewind();
      println("music on");
    }
    nextMusic.close();
    break;

  case 8:
    //image(bg7, 0, 0, width, height);
    //background(218, 221, 251);
    gamePlay();
    showScore();
    println("case7");

    if ((sensors-1) == y) {
      old_y = y;
      generateNextRandomY();
      lives++;
      gameState++;
      println("R is here");
    } else if ((sensors-1) != y) {
      nextMusic.play();
      nextMusic.rewind();
      println("music on");
    }
    nextMusic.close();
    break;

  case 9:
    //image(bg8, 0, 0, width, height);
    //background(218, 251, 248);
    gamePlay();
    showScore();
    println("case8");

    if ((sensors-1) == y) {
      old_y = y;
      generateNextRandomY();
      lives++;
      gameState++;
      println("R is here");
    } else if ((sensors-1) != y) {
      nextMusic.play();
      nextMusic.rewind();
      println("music on");
    }
    nextMusic.close();
    break;


  case 10:
    //image(bg9, 0, 0, width, height);
    //background(255, 216, 216);
    gamePlay();
    showScore();
    println("case9");

    if ((sensors-1) == y) {
      gameState++;
      old_y = y;
      generateNextRandomY();
      lives++;
      println("R is here");
    } else if ((sensors-1) != y) {
      nextMusic.play();
      nextMusic.rewind();
      println("music on");
    }
    nextMusic.close();
    break;

  case 11:
    //image(bg10, 0, 0, width, height);
    //background(208, 236, 234);
    gamePlay();
    showScore();
    println("case10");

    if ((sensors-1) == y) {
      gameState++;
      old_y = y;
      generateNextRandomY();
      lives++;
      println("R is here");
    } else if ((sensors-1) != y) {
      nextMusic.play();
      nextMusic.rewind();
      println("music on");
    }
    nextMusic.close();
    break;

  case 12:
    //background (255);
    image(bg3, 0, 0, width, height);
    winState();
    timer.stop();
    bgMusic.close();
    break;
  }
}

void titleState() {
  //background(218, 237, 251);
  image(bg0, 0, 0, width, height);
  fill(255);
  textSize(100);
  text("Let's play the game", width/7, 530);
}

void introState() {
  introMovie.play();
  image(introMovie, 0, 0, width, height);
  introMovie.read();
}

void gamePlay() {
  image(bg1, 0, 0, width, height);
  fill(myColors[y]);
  textFont(fontList[d]);
  textSize(200);
  text(nameOfColors[b], width/4, 530);
  showTime();
}

void showScore() {
  fill(255);
  textFont(fontList[2]);
  textSize(35);
  text(lives + "/10", width/8, 100);
}

void showTime() {
  fill(255);
  textFont(fontList[2]);
  textSize(35);
  text ("TIME: "+nf(timer.minute(), 2)+":"+nf(timer.second(), 2), width/1.5, 100);
}

void winState() {
  //fill(4, 213, 166); 
  fill(255);
  textFont(fontList[2]);
  textSize(100);
  text("YES!!!", width/2.3, height/3);
  //timer.stop();
  text ("YOUR TIME: "+ nf(timer.minute(), 2)+":"+nf(timer.second(), 2), width/2.8, height/1.4);
}

void generateNextRandomY() {
  a = random(0, 5);
  b = int(a);
  x = random(0, 5);
  y = int(x);
  if (y == old_y) {
    generateNextRandomY();
  }
}

void mousePressed() {
  if (gameState<13) {
    gameState++;
    x = random(0, 5);
    y = int(x);
    a = random(0, 5);
    b = int(a);
    lives++;
  }
}

void serialEvent(Serial port) {
  if (port.available()>0) {
    String inString = port.readStringUntil('\n');
    if (inString != null) {
      inString=trim(inString);

      sensors = int(inString);
      println(sensors);
      //println(split(inString, ','));
    }
  }
}