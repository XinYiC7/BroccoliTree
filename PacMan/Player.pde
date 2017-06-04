// Team BroccoliTree
// Roster: Gian "Giant" Tricarico, Xin Yi Chen, Melanie "MChow" Chow
// APCS2 pd4

class Player extends Character {
  int score;
  int numLives;
  boolean power;
  int direction;
  Player( String name) {
    super.name = name;
    super.direction=direction;
    power=false;
  }

  void encounter(Ghost a) {
  }

  void eat(Dot a) {
  }

  String toString() {
    String retStr = "";
    return retStr;
  }

  //representation of the values of x: 1-UP, 2-DOWN, 3-RIGHT, 4-LEFT
  // Implementation
  
}