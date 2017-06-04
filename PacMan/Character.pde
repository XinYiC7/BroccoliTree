// Team BroccoliTree
// Roster: Gian "Giant" Tricarico, Xin Yi Chen, Melanie "MChow" Chow
// APCS2 pd4

abstract class Character {
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

  abstract boolean move();
}