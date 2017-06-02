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
  int direction; // 0: right, 1: down, 2: left, 3: up
  boolean isAlive;

  //------------------------ Methods ------------------------

  Character() {
    speed = 1;
    xPos = 24;
    yPos = 28;
    direction = 0;
  }

  //representation of the values of x: 1-UP, 2-DOWN, 3-RIGHT, 4-LEFT 
  boolean move(int x)
  {
    // Implementation
    int oldPos;
    if (x == 1) {
      if (!PacMan.map[yPos-1][xPos].equals("#")) {
        oldPos = yPos;
        yPos -= speed;
        PacMan.map[yPos][xPos] = "@";
        for (int i = oldPos; i > yPos; i --) {
          PacMan.map[i][xPos] = "x";
        }       
        return true;
      } 
      return false;
    } else if (x == 2) {
      if (!PacMan.map[yPos+1][xPos].equals("#")) { 
        oldPos = yPos;
        yPos += speed;

        for (int i = oldPos; i < yPos; i++) {
          PacMan.map[i][xPos]= "x";
        }
        PacMan.map[yPos][xPos]= "@";
        //println(PacMan.map[xPos][yPos]);
        return true;
      } 
      return false;
    } else if (x == 3) {
      if (!PacMan.map[yPos][xPos+1].equals("#")) { 
        oldPos = xPos;
        xPos += speed;

        for (int i = oldPos; i < xPos; i ++) {
          PacMan.map[yPos][i] = "x";
        }

        PacMan.map[yPos][xPos] = "@";
        return true;
      } 
      return false;
    } else if (x == 4) {
      if (!PacMan.map[yPos][xPos-1].equals("#")) { 
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