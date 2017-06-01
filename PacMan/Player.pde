class Player extends Character {
  int score;
  int numLives;
  boolean power;
  Player( String name) {
    super.name = name;
  }

  boolean hasPower() {
    return false;
  }

  void encounter(Ghost a) {
  }

  void eat(Dot a) {
  }

  String toString() {
    String retStr = "";
    return retStr;
  }
}