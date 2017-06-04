// Team BroccoliTree
// Roster: Gian "Giant" Tricarico, Xin Yi Chen, Melanie "MChow" Chow
// APCS2 pd4

/*
class Ghost: for the ghosts that try to kill Pacman
 For now, movement is randomized.
 */
class Ghost extends Character {

  //------------------------ Instance variables ------------------------

  int state; // 0-jailed 1-alive 2-blue
  // When state == 2, Pac-Man can eat the ghost.
  
  // The rest of the variables are inherited from class Character.

  Ghost() {
    super();
    this.state = 0;
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