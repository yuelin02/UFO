import processing.video.*;
import ddf.minim.*;
import processing.serial.*;

Serial portA;
Serial portB;

int gridX = width/20;

Minim minim;
Movie introMovie;
AudioPlayer bgMusic, hitMusic, nextMusic, yesMusic;
PImage bg0, bg1, bg2, bg3;
PFont[] fontList = new PFont[3];
String[] nameOfColors = {"ORANGE", "GREEN", "PURPLE", "BLUE", "YELLOW", "RED"};
color[] myColors = {color(255, 0, 0), color(255, 255, 0), color(0, 0, 255), color(255, 130, 20), 
  color(0, 255, 0), color(160, 32, 250)};

PFont main;
PFont titleItalic;
PFont title;
PFont subtitle;

int titleS;
int subtitleS;
int mainS;
int textS;
int noteS;

Timer timer;
int gameoverTime = 0;

Team teamA;
Team teamB;
CountDown count;

int state = 0;
int gameState = 0;

void setup() {
  background(0);
  //size(800, 600);
  fullScreen();
  smooth();

  /*------------------------------------------------------------------------
   Serial Port
   ------------------------------------------------------------------------*/
  println(Serial.list());
  //portA = new Serial(this, Serial.list()[1], 9600);
  //portB = new Serial(this, Serial.list()[2], 9600);
  //portA.bufferUntil('\n');
  //portB.bufferUntil('\n');

  /*------------------------------------------------------------------------
   Font
   ------------------------------------------------------------------------*/
  title = createFont("Mekanik Plain.ttf", 2);
  titleItalic = createFont("Mekanik Italic Plain.ttf", 2);
  subtitle = createFont("Roboto-Regular.ttf", 2);
  main = createFont("sketches font.ttf", 2);

  fontList[0] = createFont("Ruler.ttf", 2);
  fontList[1] = createFont("Circo.ttf", 2);
  fontList[2] = createFont("sketches font.ttf", 2); 

  titleS = width/5;
  subtitleS = width/16;
  mainS = width/28;
  textS = width/32;
  noteS = width/48;

  //fontList[4] = createFont("Prisma.ttf", 2);
  //fontList[5] = createFont("5x5_pixel.ttf", 2);

  /*------------------------------------------------------------------------
   AV
   ------------------------------------------------------------------------*/
  minim = new Minim(this);

  introMovie = new Movie(this, "intro.mov");

  bgMusic= minim.loadFile("tricks.mp3", 1024);
  hitMusic= minim.loadFile("bounce.mp3", 1024);
  nextMusic= minim.loadFile("jump.mp3", 1024);
  yesMusic = minim.loadFile("yes.mov", 1024);

  bg0 = loadImage("bg0.png");
  bg1 = loadImage("bg1.png");
  bg2 = loadImage("bg8.png");
  bg3 = loadImage("bg11.png");

  teamA = new Team();
  teamB = new Team();
  count = new CountDown();
  timer = new Timer();
}


void draw() {
  background(0);

  switch (gameState) {
  case 0:
    titleState();  
    //bgMusic.play();
    count.draw();

    println("case0: title");
    break; 

  case 1:
    //fill(50, 150, 255);
    //rect(0, 0, width, height);
    image(bg3, 0, 0, width, height);

    count.draw();
    count.readyStart();

    println("case1: start count down");
    break;

  case 2:
    image(bg3, 0, 0, width, height);
    //background(255, 239, 211);
    showTime();

    teamA.posX = -(width/4);
    teamB.posX = width/4;

    if (teamA.level!=10 && teamB.level!=10) {
      teamA.levelChange();
      println("-------------------------teamA-------------------------");
      teamB.levelChange();
      println("-------------------------teamB-------------------------");
    } else {
      gameState++;
      timer.stop();
      gameoverTime = int((timer.stopTime - timer.startTime)*0.001);
    }

    println("case2: game play");
    break;

  case 3:
    image(bg3, 0, 0, width, height);
    winState();
    bgMusic.close();

    println("case3: game over");
    break;
  }
}

void titleState() {
  image(bg0, 0, 0, width, height);
  textFont(titleItalic);
  textAlign(CENTER);
  textSize(titleS);
  fill(10, 255, 192);
  text("U.F.O BELLIES", width/2, 9*height/16);

  textFont(subtitle);
  textAlign(CENTER);
  textSize(mainS);
  fill(10, 255, 192);
  text("Press SPACE to START", width/2, 11*height/16);
}

void showTime() {
  textFont(main);
  textAlign(CENTER);
  textSize(mainS);
  fill(255);
  text ("TIME: "+nf(timer.minute(), 2)+":"+nf(timer.second(), 2), (width/2), height/12);
}

void winState() {

  if (teamA.level == 10 && teamB.level != 10) {
    println("teamA win!!!!!!!!!!!!");
    teamA.gameOver();
    teamB.gameOver();    

    textSize(subtitleS);
    fill(255, 20, 20);
    text("WIN!", width/2+teamA.posX, height/2);
    fill(10, 255, 192);
    text("LOSE", width/2+teamB.posX, height/2);
    
    textFont(subtitle);
    textSize(textS);
    fill(255);
    text("SPACE to TRY AGAIN", width/2, height/12);
    
    textSize(mainS);
    text("You made it in ", width/2+teamA.posX, 10*height/16);
    text(gameoverTime + " secs!", width/2+teamA.posX, ((10*height/16)+(5*mainS)/4));

  } else if (teamA.level != 10 && teamB.level == 10) {
    println("teamB win!!!!!!!!!!!!");
    teamA.gameOver();
    teamB.gameOver();

    textSize(subtitleS);
    fill(255, 20, 20);
    text("WIN!", width/2+teamB.posX, height/2);
    fill(10, 255, 192);
    text("LOSE", width/2+teamA.posX, height/2);
    
    textFont(subtitle);
    textSize(textS);
    fill(255);
    text("SPACE to TRY AGAIN", width/2, height/12);
    
    textSize(mainS);
    text("You made it in ", width/2+teamB.posX, 10*height/16);
    text(gameoverTime + " secs!", width/2+teamB.posX, ((10*height/16)+(5*mainS)/4));

  } else if (teamA.level == 10 && teamB.level == 10) {
    screen();

    textFont(subtitle);;
    textSize(subtitleS);
    fill(255);
    text("It's a TIE!", width/2, 9*height/16);
    
    textSize(textS);
    text("SPACE to try one more time", width/2, height/12);
  } else if (teamA.level != 10 && teamB.level != 10) {
    screen();

    textFont(subtitle);
    textSize(subtitleS);
    fill(255);
    text("SPACE to restart", width/2, 9*height/16);
  }
}

void reset() {
  gameState=0;
  teamA.reset();
  teamB.reset();
  count.reset();
}

void screen(){
  fill(0, 200);
  noStroke();
  rectMode(CENTER);
  rect(width/2, 17*height/32, 11*width/12, 4*height/5); 
}

void keyPressed() {
  if (key == ' ') {
    if (gameState<3) {
        gameState++;
        count.reset();
    } else if (gameState == 3) {
      reset();
    }
  }
  if (key == 'r') {
    reset();
  }
}

void mousePressed() {
  if (gameState==2) {
    if (mouseButton == LEFT) {
      teamA.level++;
      teamA.y = int(random(0, 5));
      teamA.b = int(random(0, 5));
      teamA.d = int(random(0, 2));
      teamA.lives++;
    } else if (mouseButton == RIGHT) {
      teamB.level++;
      teamB.y = int(random(0, 5));
      teamB.b = int(random(0, 5));
      teamB.d = int(random(0, 2));
      teamB.lives++;
    }
  }
}

//void introState() {
//  introMovie.play();
//  image(introMovie, 0, 0, width, height);
//  introMovie.read();
//}