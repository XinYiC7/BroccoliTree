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

  boolean move()
  {
    return true;
  }

  boolean inJail() {
    return false;
  }

  void normalize() {
  }
}