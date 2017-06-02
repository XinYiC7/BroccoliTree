/*
class Ghost: for the ghosts that try to kill Pacman
 For now, movement is randomized.
 */
class Ghost extends Character {

  //------------------------ Instance variables ------------------------

  int state;
  // The rest of the variables are inherited from class Character.

  Ghost() {
  }

  boolean inJail() {
    return false;
  }

  void normalize() {
  }
}