// Team BroccoliTree
// Roster: Gian "Giant" Tricarico, Xin Yi Chen, Melanie "MChow" Chow
// APCS2 pd4

class Player extends Character {
  int score;
  int numLives;
  boolean power;
  Player( String name) {
    super();
    this.name = name;
    power=false;
    score=0;
    numLives=3;
  }

  void encounter(Ghost a) {
  }

  void eat(Dot a) {
  }

  String toString() {
    String retStr = "";
    return retStr;
  }

  boolean move(int x) {
    int oldPos;
    if (this.direction == 1) { // (up)
      if (PacMan.map[yPos-1][xPos].equals("d")|
          PacMan.map[yPos-1][xPos].equals("p") |
          PacMan.map[yPos-1][xPos].equals("b")|
          PacMan.map[yPos-1][xPos].equals("x")){
        oldPos = yPos;
        yPos -= speed;
        PacMan.map[yPos][xPos] = "@";
        for (int i = oldPos; i > yPos; i --) {
          PacMan.map[i][xPos] = "x";
        }
        if (PacMan.map[yPos-1][xPos].equals("d")){
          this.score+=10;
        }
        if (PacMan.map[yPos-1][xPos].equals("p")){
          this.score+=50;
          power=true;
        }
        if (PacMan.map[yPos-1][xPos].equals("b")){
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
        if (PacMan.map[yPos+1][xPos].equals("d")){
          this.score+=10;
        }
        if (PacMan.map[yPos+1][xPos].equals("p")){
          this.score+=50;
          power=true;
        }
        if (PacMan.map[yPos+1][xPos].equals("b")){
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
        if (PacMan.map[yPos][xPos+1].equals("d")){
          this.score+=10;
        }
        if (PacMan.map[yPos][xPos+1].equals("p")){
          this.score+=50;
          power=true;
        }
        if (PacMan.map[yPos][xPos+1].equals("b")){
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
        if (PacMan.map[yPos][xPos-1].equals("d")){
          this.score+=10;
        }
        if (PacMan.map[yPos][xPos-1].equals("p")){
          this.score+=50;
          power=true;
        }
        if (PacMan.map[yPos][xPos-1].equals("b")){
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