// Team BroccoliTree
// Roster: Gian "Giant" Tricarico, Xin Yi Chen, Melanie "MChow" Chow
// APCS2 pd4

// class Ghost: for the ghosts that try to kill Pacman
class Ghost extends Character {

  String oldpiece;
  String identity; //1:Blinky, 2:Pinky, 3:Inky, 4:Clyde
  // int startMove; redundant because Ghost already inherits state variable from Character

  // constructor
  Ghost(String identity, int x, int y) {
    super();
    this.identity = identity;
    this.xPos = x;
    this.yPos = y;
    this.state = 0; // ghosts start in jail
    this.oldpiece = null;
  }

  boolean move() {
    int direction = ((int)random(4))+1;
    while (!(move(direction, this.identity))) {
      direction = ((int)random(4))+1;
    }
    //move(direction,this.identity);
    return true;
  }

  boolean move(int x, String ghostnum) {
    int oldPos;
    if ( this.xPos == player.xPos && this.yPos == player.yPos) {
      if (player.state == 2) {
        PacMan.map[this.yPos][this.xPos] = "@";
        //println(PacMan.map[this.yPos][this.xPos]);

        if (identity.equals("1")) {
          this.xPos = 15;
          this.yPos = 16;
          PacMan.map[this.yPos][this.xPos] = identity;
          liveGhosts.remove(Blinky);
          jailedGhosts.enqueue(Blinky);
        } else if (identity.equals("2")) {
          this.xPos = 17;
          this.yPos = 16;
          PacMan.map[this.yPos][this.xPos] = identity;
          liveGhosts.remove(Pinky);
          jailedGhosts.enqueue(Pinky);
        } else if (identity.equals("3")) {
          this.xPos = 15;
          this.yPos = 17;
          PacMan.map[this.yPos][this.xPos] = identity;
          liveGhosts.remove(Inky);
          jailedGhosts.enqueue(Inky);
        } else {
          this.xPos = 17;
          this.yPos = 17;
          PacMan.map[this.yPos][this.xPos] = identity;
          liveGhosts.remove(Clyde);
          jailedGhosts.enqueue(Clyde);
        }        
        player.state = 1;
      } 
      return true;
    } else {
      if (x == 1) { // (up)
        if (!(PacMan.map[yPos-1][xPos].equals("#")|
          PacMan.map[yPos-1][xPos].equals("s") |
          PacMan.map[yPos-1][xPos].equals("t")|
          PacMan.map[yPos-1][xPos].equals("u") |
          PacMan.map[yPos-1][xPos].equals("y")|
          PacMan.map[yPos-1][xPos].equals("j")|
          PacMan.map[yPos-1][xPos].equals("1")|
          PacMan.map[yPos-1][xPos].equals("2")|
          PacMan.map[yPos-1][xPos].equals("3")|
          PacMan.map[yPos-1][xPos].equals("4")
          )) {
          this.oldpiece=PacMan.map[yPos-1][xPos];
          oldPos = yPos;
          yPos -= speed;
          if (oldpiece.equals("@")) {
            PacMan.map[oldPos][xPos] = "x";
          } else {
            PacMan.map[oldPos][xPos] = oldpiece;
          }

          PacMan.map[yPos][xPos]= ghostnum;
          //}
          return true;
        }
        return false;
      } else if (x == 2) { // (down)
        if (!(PacMan.map[yPos+1][xPos].equals("#")|
          PacMan.map[yPos+1][xPos].equals("s") |
          PacMan.map[yPos+1][xPos].equals("t")|
          PacMan.map[yPos+1][xPos].equals("u")|
          PacMan.map[yPos+1][xPos].equals("y")|
          PacMan.map[yPos+1][xPos].equals("j")|
          PacMan.map[yPos+1][xPos].equals("1")|
          PacMan.map[yPos+1][xPos].equals("2")|
          PacMan.map[yPos+1][xPos].equals("3")|
          PacMan.map[yPos+1][xPos].equals("4")
          )) {

          this.oldpiece=PacMan.map[yPos+1][xPos];
          oldPos = yPos;
          yPos += speed;        

          if (oldpiece.equals("@")) {
            PacMan.map[oldPos][xPos] = "x";
          } else {
            PacMan.map[oldPos][xPos] = oldpiece;
          }

          PacMan.map[yPos][xPos]= ghostnum;
          //  }
          return true;
        } 
        return false;
      } else if (x == 3) { // (right)
        if (!(PacMan.map[yPos][xPos+1].equals("#")|
          PacMan.map[yPos][xPos+1].equals("s") |
          PacMan.map[yPos][xPos+1].equals("t")|
          PacMan.map[yPos][xPos+1].equals("u")|
          PacMan.map[yPos][xPos+1].equals("y")|
          PacMan.map[yPos][xPos+1].equals("j")|
          PacMan.map[yPos][xPos+1].equals("1")|
          PacMan.map[yPos][xPos+1].equals("2")|
          PacMan.map[yPos][xPos+1].equals("3")|
          PacMan.map[yPos][xPos+1].equals("4")
          )) {

          this.oldpiece=PacMan.map[yPos][xPos+1];
          oldPos = xPos;
          xPos += speed;

          if (oldpiece.equals("@")) {
            PacMan.map[yPos][oldPos] = "x";
          } else {
            PacMan.map[yPos][oldPos]= oldpiece;
          }

          PacMan.map[yPos][xPos]= ghostnum;
          //}

          return true;
        } 
        return false;
      } else if (x == 4) { // (left)
        if (!(PacMan.map[yPos][xPos-1].equals("#")|
          PacMan.map[yPos][xPos-1].equals("s") |
          PacMan.map[yPos][xPos-1].equals("t")|
          PacMan.map[yPos][xPos-1].equals("u")|
          PacMan.map[yPos][xPos-1].equals("y")|
          PacMan.map[yPos][xPos-1].equals("j")|
          PacMan.map[yPos][xPos-1].equals("1")|
          PacMan.map[yPos][xPos-1].equals("2")|
          PacMan.map[yPos][xPos-1].equals("3")|
          PacMan.map[yPos][xPos-1].equals("4")
          )) {
          this.oldpiece=PacMan.map[yPos][xPos-1];
          oldPos = xPos;
          xPos -= speed;

          if (oldpiece.equals("@")) {
            PacMan.map[yPos][oldPos] = "x";
          } else {
            PacMan.map[yPos][oldPos]= oldpiece;
          }

          PacMan.map[yPos][xPos]= ghostnum;
          //}
          return true;
        }
        return false;
      } else {      
        return false;
      }
    }
  }
}