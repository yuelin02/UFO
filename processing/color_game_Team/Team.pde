class Team {
  int level = -1;
  int lives = -1;
  //int sensors;
  int posX, posY, w, h;

  //float x = random(0, 5);
  int y = int(random(nameOfColors.length));
  //float a = random(0, 5);
  int b = int(random(nameOfColors.length));
  int old_y = -1;
  int d = int(random(3));

  void levelChange(int sensors) {
    switch(level) {
    case -1:   
      timer.start();
      level++;
      break;

    case 0:
      //image(bg9, 0, 0, width, height);
      //background(255, 216, 216);
      gamePlay();
      showScore();
      println("level1, y value: "+y);

      if ((sensors-1) == y) {
        old_y = y;
        generateNextRandomY();
        level++;
        lives++;
        println("R is here");
      } else if ((sensors-1) != y && sensors !=0) {
        nextMusic.play();
        nextMusic.rewind();
        println("music on");
      }
      nextMusic.close();
      break;

    case 1:
      //image(bg9, 0, 0, width, height);
      //background(255, 216, 216);
      gamePlay();
      showScore(); 

      println("level2, y value: "+y);

      if ((sensors-1) == y) {
        old_y = y;
        generateNextRandomY();
        level++;
        lives++;
        println("R is here");
      } else if ((sensors-1) != y && sensors !=0) {
        nextMusic.play();
        nextMusic.rewind();
        println("music on");
      }
      nextMusic.close();
      break;

    case 2:
      //image(bg9, 0, 0, width, height);
      //background(255, 216, 216);
      gamePlay();
      showScore();      
      println("level3, y value: "+y);

      if ((sensors-1) == y) {
        old_y = y;
        generateNextRandomY();
        level++;
        lives++;
        println("R is here");
      } else if ((sensors-1) != y && sensors !=0) {
        nextMusic.play();
        nextMusic.rewind();
        println("music on");
      }
      nextMusic.close();
      break;

    case 3:
      //image(bg9, 0, 0, width, height);
      //background(255, 216, 216);
      gamePlay();
      showScore();      
      println("level4, y value: "+y);

      if ((sensors-1) == y) {
        old_y = y;
        generateNextRandomY();
        level++;
        lives++;
        println("R is here");
      } else if ((sensors-1) != y && sensors !=0) {
        nextMusic.play();
        nextMusic.rewind();
        println("music on");
      }
      nextMusic.close();
      break;

    case 4:
      //image(bg9, 0, 0, width, height);
      //background(255, 216, 216);
      gamePlay();
      showScore();      
      println("level5, y value: "+y);

      if ((sensors-1) == y) {
        old_y = y;
        generateNextRandomY();
        level++;
        lives++;
        println("R is here");
      } else if ((sensors-1) != y && sensors !=0) {
        nextMusic.play();
        nextMusic.rewind();
        println("music on");
      }
      nextMusic.close();
      break;

    case 5:
      //image(bg9, 0, 0, width, height);
      //background(255, 216, 216);
      gamePlay();
      showScore();      
      println("level6, y value: "+y);

      if ((sensors-1) == y) {
        old_y = y;
        generateNextRandomY();
        level++;
        lives++;
        println("R is here");
      } else if ((sensors-1) != y && sensors !=0) {
        nextMusic.play();
        nextMusic.rewind();
        println("music on");
      }
      nextMusic.close();
      break;

    case 6:
      //image(bg9, 0, 0, width, height);
      //background(255, 216, 216);
      gamePlay();
      showScore();      
      println("level7, y value: "+y);

      if ((sensors-1) == y) {
        old_y = y;
        generateNextRandomY();
        level++;
        lives++;
        println("R is here");
      } else if ((sensors-1) != y && sensors !=0) {
        nextMusic.play();
        nextMusic.rewind();
        println("music on");
      }
      nextMusic.close();
      break;

    case 7:
      //image(bg9, 0, 0, width, height);
      //background(255, 216, 216);
      gamePlay();
      showScore();      
      println("level8, y value: "+y);

      if ((sensors-1) == y) {
        generateNextRandomY();
        old_y = y;
        level++;
        lives++;
        println("R is here");
      } else if ((sensors-1) != y && sensors !=0) {
        nextMusic.play();
        nextMusic.rewind();
        println("music on");
      }
      nextMusic.close();
      break;

    case 8:
      //image(bg9, 0, 0, width, height);
      //background(255, 216, 216);
      gamePlay();
      showScore();      
      println("level9, y value: "+y);

      if ((sensors-1) == y) {
        old_y = y;
        generateNextRandomY();
        level++;
        lives++;
        println("R is here");
      } else if ((sensors-1) != y && sensors !=0) {
        nextMusic.play();
        nextMusic.rewind();
        println("music on");
      }
      nextMusic.close();
      break;

    case 9:
      //image(bg9, 0, 0, width, height);
      //background(255, 216, 216);
      gamePlay();
      showScore();      
      println("level10, y value: "+y);

      if ((sensors-1) == y) {
        level++;
        println("R is here");
      } else if ((sensors-1) != y && sensors !=0) {
        nextMusic.play();
        nextMusic.rewind();
        println("music on");
      }
      nextMusic.close();
      break;
    }
  }

  void gamePlay() {
    //image(bg1, 0, 0, width, height);
    fill(0, 200);
    noStroke();
    rectMode(CENTER);
    rect(((width/2)+posX), 17*height/32, 5*width/12, 4*height/5);

    textFont(fontList[d]);
    fill(myColors[y]);
    textAlign(CENTER);
    textSize(subtitleS);
    text(nameOfColors[b], (width/2)+posX, 18*height/32);
  }

  void generateNextRandomY() {
    println("this works!!!!!!!!!!");
    b = int(random(nameOfColors.length));
    y = int(random(nameOfColors.length));
    if (y == old_y) {
      generateNextRandomY();
    }
  }

  void showScore() {
    textFont(main);
    textAlign(CENTER);
    textSize(mainS);
    fill(255);
    text(lives + "/10", (width/2)+posX, (17*height/32)-(2*height/5)+60);
  }

  void gameOver() {
    fill(0, 200);
    noStroke();
    rectMode(CENTER);
    rect(((width/2)+posX), 17*height/32, 5*width/12, 4*height/5); 
    textFont(main);
    textAlign(CENTER);
  }

  void reset() {
    level = -1;
    lives = -1;
  }


}