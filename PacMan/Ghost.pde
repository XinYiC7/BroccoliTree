// Team BroccoliTree
// Roster: Gian "Giant" Tricarico, Xin Yi Chen, Melanie "MChow" Chow
// APCS2 pd4

// class Ghost: for the ghosts that try to kill Pacman
class Ghost extends Character {

  // constructor
  Ghost(int x, int y) {
    super();
    this.xPos = x;
    this.yPos = y;
    this.state = 0; // ghosts start in jail
  }
  boolean move(){
    return true;
  }

  boolean move(int x, String ghostnum) {
    int oldPos;
    if (x == 1) { // (up)
      if (!(PacMan.map[yPos-1][xPos].equals("#")|
        PacMan.map[yPos-1][xPos].equals("s") |
        PacMan.map[yPos-1][xPos].equals("t")|
        PacMan.map[yPos-1][xPos].equals("u") |
        PacMan.map[yPos-1][xPos].equals("y"))) {
        oldPos = yPos;
        yPos -= speed;
        for (int i = oldPos; i > yPos; i --) {
          PacMan.map[i][xPos] = "x";
        }
        PacMan.map[yPos][xPos]= ghostnum;
        return true;
      }

      return false;
    }
    else if (x == 2) { // (down)
      if (!(PacMan.map[yPos+1][xPos].equals("#")|
        PacMan.map[yPos+1][xPos].equals("s") |
        PacMan.map[yPos+1][xPos].equals("t")|
        PacMan.map[yPos+1][xPos].equals("u")|
        PacMan.map[yPos+1][xPos].equals("y"))) { 
        oldPos = yPos;
        yPos += speed;
        for (int i = oldPos; i < yPos; i ++) {
        PacMan.map[i][xPos] = "x";
        }
        PacMan.map[yPos][xPos]= ghostnum;
        return true;
      } 
      return false;
    } 
    else if (x == 3) { // (right)
      if (!(PacMan.map[yPos][xPos+1].equals("#")|
        PacMan.map[yPos][xPos+1].equals("s") |
        PacMan.map[yPos][xPos+1].equals("t")|
        PacMan.map[yPos][xPos+1].equals("u")|
        PacMan.map[yPos][xPos+1].equals("y"))) { 
        oldPos = xPos;
        xPos += speed;
        for (int i = oldPos; i < xPos; i ++) {
        PacMan.map[yPos][i] = "x";
        }
        PacMan.map[yPos][xPos] = ghostnum;
        return true;
      } 
      return false;
    }
    else if (x == 4) { // (left)
      if (!(PacMan.map[yPos][xPos-1].equals("#")|
        PacMan.map[yPos][xPos-1].equals("s") |
        PacMan.map[yPos][xPos-1].equals("t")|
        PacMan.map[yPos][xPos-1].equals("u")|
        PacMan.map[yPos][xPos-1].equals("y"))) { 
        oldPos = xPos;
        xPos -= speed;
        for (int i = oldPos; i > xPos; i --) {
        PacMan.map[yPos][i] = "x";
        }
        PacMan.map[yPos][xPos] = ghostnum;
        return true;
      }
      return false;
    } 
    else {      
      return false;
    }
  }
  
/*  void ghostmove(int pacx, int pacy,String ghostnum){
    int deltx=this.xPos-pacx;
    int delty=this.xPos-pacy;
    //ghost should move sideways
    if (abs(deltx)>abs(delty)){
      if (deltx>0){
        this.move(4, ghostnum);
      }
      else{
        this.move(3, ghostnum);
      }
    }
    else{
      if (delty>0){
        this.move(1, ghostnum);
      }
      else {
        this.move(2, ghostnum);
      }
    }
  }*/

  boolean inJail() {
    return false;
  }

  void normalize() {
  }
}