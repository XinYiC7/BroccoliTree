// Team BroccoliTree
// Roster: Gian "Giant" Tricarico, Xin Yi Chen, Melanie "MChow" Chow
// APCS2 pd4

class Player extends Character {
  String name;
  int score;
  int numLives;
  int direction; // 1-up 2-down 3-right 4=left
  String killedBy; // 1: Blinky, 2: Pinky, 3:Inky, 4:Clyde

  Player() {
    super();
    this.name = "";
    this.xPos = 24;
    this.yPos = 28;
    this.state = 1; // Player starts out alive
    this.score=0;
    this.numLives=3;
    this.direction=0;
    // scoreSubmitted=false; already instantiated in main class
    this.killedBy = null;
  }

  void encounter(Ghost a) {
  }

  /*
  void eat(Dot a) {
   }
   */

  public String toString() {
    String retStr = this.name;
    retStr += "\nScore: " + this.score;
    return retStr;
  }

  boolean touchingGhost() {
    if (this.xPos == Clyde.xPos && this.yPos == Clyde.yPos) {
      killedBy = "4";
      //PacMan.map[this.yPos][this.xPos] = "4"; 
      return true;
    }
    if (this.xPos == Pinky.xPos && this.yPos == Pinky.yPos) {
      killedBy = "2";
      //PacMan.map[this.yPos][this.xPos] = "2"; 
      return true;
    } 
    if (this.xPos == Inky.xPos && this.yPos == Inky.yPos) {
      killedBy = "3";
      //PacMan.map[this.yPos][this.xPos] = "3"; 
      return true;
    }
    if (this.xPos == Blinky.xPos && this.yPos == Blinky.yPos) {
      killedBy = "1";
      //PacMan.map[this.yPos][this.xPos] = "1"; 
      return true;
    }
    return false;
  }



  /* moves the player (Pac Man) according to its direction attribute
   If the player moves onto a dot, it eats the dot.
   */
  boolean move() {
    if (touchingGhost()) {
      numLives--;
      if (numLives==0) {

        text("Game Over", xPos, yPos);
        screen=3;
        setMap();
        return false;
      } else {
        text("WHOOPS! A life you lose.", xPos, yPos);
        endRound();
        return false;
      }
    } else {
      int oldPos;
      Dot eatenDot;
      if (this.direction == 1) { // (up)
        if (PacMan.map[yPos-1][xPos].equals("d")|
          PacMan.map[yPos-1][xPos].equals("p") |
          PacMan.map[yPos-1][xPos].equals("b")|
          PacMan.map[yPos-1][xPos].equals("x")) {
          oldPos = yPos;
          yPos -= speed;

          for (int i = oldPos; i > yPos; i --) {
            PacMan.map[i][xPos] = "x";
          }
          PacMan.map[yPos][xPos] = "@";
          if (PacMan.map[yPos-1][xPos].equals("d")) {
            eatenDot = new Dot(1, xPos, yPos-1);
            eaten.enqueue(eatenDot);
            this.score+=10;
          }
          if (PacMan.map[yPos-1][xPos].equals("p")) {
            eatenDot = new Dot(2, xPos, yPos-1);
            eaten.enqueue(eatenDot);
            this.score+=50;
            this.state = 2;
          }
          if (PacMan.map[yPos-1][xPos].equals("b")) {
            eatenDot = new Dot(3, xPos, yPos-1);
            eaten.enqueue(eatenDot);
            this.score+=30;
          }
          return true;
        }
        return false;
      } else if (this.direction == 2) { // (down)
        if (PacMan.map[yPos+1][xPos].equals("d")|
          PacMan.map[yPos+1][xPos].equals("p") |
          PacMan.map[yPos+1][xPos].equals("b")|
          PacMan.map[yPos+1][xPos].equals("x")) { 
          oldPos = yPos;
          yPos += speed;

          for (int i = oldPos; i < yPos; i++) {
            PacMan.map[i][xPos]= "x";
          }
          PacMan.map[yPos][xPos]= "@";
          if (PacMan.map[yPos+1][xPos].equals("d")) {
            eatenDot = new Dot(1, xPos, yPos+1);
            eaten.enqueue(eatenDot);
            this.score+=10;
          }
          if (PacMan.map[yPos+1][xPos].equals("p")) {
            eatenDot = new Dot(2, xPos, yPos+1);
            eaten.enqueue(eatenDot);
            this.score+=50;
            this.state = 2;
          }
          if (PacMan.map[yPos+1][xPos].equals("b")) {
            eatenDot = new Dot(3, xPos, yPos+1);
            eaten.enqueue(eatenDot);
            this.score+=30;
          }        
          return true;
        } 
        return false;
      } else if (this.direction == 3) { // (right)
        if (PacMan.map[yPos][xPos+1].equals("d")|
          PacMan.map[yPos][xPos+1].equals("p") |
          PacMan.map[yPos][xPos+1].equals("b")|
          PacMan.map[yPos][xPos+1].equals("x")) { 
          oldPos = xPos;
          xPos += speed;

          for (int i = oldPos; i < xPos; i ++) {
            PacMan.map[yPos][i] = "x";
          }

          PacMan.map[yPos][xPos] = "@";
          if (PacMan.map[yPos][xPos+1].equals("d")) {
            eatenDot = new Dot(1, xPos+1, yPos);
            eaten.enqueue(eatenDot);
            this.score+=10;
          }
          if (PacMan.map[yPos][xPos+1].equals("p")) {
            eatenDot = new Dot(2, xPos+1, yPos);
            eaten.enqueue(eatenDot);
            this.score+=50;
            this.state = 2;
          }
          if (PacMan.map[yPos][xPos+1].equals("b")) {
            eatenDot = new Dot(3, xPos+1, yPos);
            eaten.enqueue(eatenDot);
            this.score+=30;
          }        
          return true;
        } 
        return false;
      } else if (this.direction == 4) { // (left)
        if (PacMan.map[yPos][xPos-1].equals("d")|
          PacMan.map[yPos][xPos-1].equals("p") |
          PacMan.map[yPos][xPos-1].equals("b")|
          PacMan.map[yPos][xPos-1].equals("x")) { 
          oldPos = xPos;
          xPos -= speed;

          for (int i = oldPos; i > xPos; i --) {
            PacMan.map[yPos][i]= "x";
          }

          PacMan.map[yPos][xPos] = "@";
          if (PacMan.map[yPos][xPos-1].equals("d")) {
            eatenDot = new Dot(1, xPos-1, yPos);
            eaten.enqueue(eatenDot);
            this.score+=10;
          }
          if (PacMan.map[yPos][xPos-1].equals("p")) {
            eatenDot = new Dot(2, xPos-1, yPos);
            eaten.enqueue(eatenDot);
            this.score+=50;
            this.state = 2;
          }
          if (PacMan.map[yPos][xPos-1].equals("b")) {
            eatenDot = new Dot(3, xPos-1, yPos);
            eaten.enqueue(eatenDot);
            this.score+=30;
          } 
          return true;
        }
        return false;
      } else {      
        return false;
      }
    }
  }
  /*
  void loseLive() {
   this.xPos = 24;
   this.yPos = 28;
   PacMan.map[this.yPos][this.xPos] = "@";
   numLives--;
   }*/
}