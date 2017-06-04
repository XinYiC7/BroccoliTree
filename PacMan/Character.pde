// Team BroccoliTree
// Roster: Gian "Giant" Tricarico, Xin Yi Chen, Melanie "MChow" Chow
// APCS2 pd4

abstract class Character {
  //contains attributes and methods that both Player and Ghost need


  //------------------------ instance vars ------------------------
  String name; // for Player, name entered by user; for Ghost, preset names
  int speed; // In full version, ghost speed increases at higher difficulties (not in MVP)
  int xPos;
  int yPos;
  int direction; // 1-up 2-down 3-right 4=left
  int state; /* 0-dead 1-alive 2-power
   For ghosts, dead means in jail.
   power means that Pac-Man can eat the ghosts.
   */

  //------------------------ Methods ------------------------

  Character(String newName) {
    this.name = newName;
    this.speed = 1;
    this.direction = 0; // Character is stationary at beginning
  }

  abstract boolean move();
}