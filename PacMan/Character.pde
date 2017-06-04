// Team BroccoliTree
// Roster: Gian "Giant" Tricarico, Xin Yi Chen, Melanie "MChow" Chow
// APCS2 pd4

class Character {
  //contains attributes and methods that both Player and Ghost need


  //------------------------ instance vars ------------------------
  String name; // for Player, name entered by user; for Ghost, preset names
  color c;
  int speed; // In full version, ghost speed increases at higher difficulties (not in MVP)
  int xPos;
  int yPos;
  int direction; // 1-up 2-down 3-right 4=left
  boolean isAlive;

  //------------------------ Methods ------------------------

  Character() {
    speed = 1;
    xPos = 24;
    yPos = 28;
    this.direction = 0;
  }

  // Moves the Character according to its direction attribute
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
        return true;
      }
      return false;
    } else {      
      return false;
    }
  }
}