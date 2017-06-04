// Team BroccoliTree
// Roster: Gian "Giant" Tricarico, Xin Yi Chen, Melanie "MChow" Chow
// APCS2 pd4

//------------------------ Instance variables ------------------------

// Each block in the game's grid is made up of _blocksize * _blocksize pixels:
int _blocksize = 20;
Player player = new Player(null);
// 3D array for use in filling the processing window:
static String[][] map = new String[32][32];
//eaten dots
ALQueue<Dot> eaten = new ALQueue<Dot>();

// int counter = 0;

int screen=0; //determines what is being shown on the screen 0=start 1=pacman 2=tower, etc

//-----START SCREEN IMAGES & VARIABLES------
PImage img; //startscreen

PImage start1; //start button
PImage start2; //hover 
PImage hs1; //high score button
PImage hs2; //hover
PImage h2p1; //how to play button
PImage h2p2; //hover
PImage homebutton1; //home button
PImage homebutton2; //hover

PImage h2ptab;
PImage highscoretab;

PFont font; //text
//----------CHARACTER IMAGES-----------
PImage pacman;
PImage pacman1;
PImage pacman2;
PImage pacman3;
PImage pacman4;

PImage redghost;
PImage pinkghost;
PImage orangeghost;
PImage blueghost;

//---------- Methods ------------------------

/*
facilitates progress of tower minigame (helper method for draw)
 */
void miniGame()
{
  // Implementation (after completion of MVP)
}

void setup() {
  size(680, 720);
  background(0, 0, 0);
  setMap();
  setimages();
  font=createFont("imagine_font.ttf", 20);
  textFont(font);
  textAlign(LEFT, LEFT);
}

void draw() {
  // counter ++;
  if (screen==0) {
    drawStartScreen();
  } else if (screen==1) {
    background(0, 0, 0);
    drawMap();
    frameRate(6);
    player.move();
    //print(player.direction);
    fill(255, 255, 255);
    text("NAME:  "+player.name, 80, 50);
    fill (255, 25, 0);
    text("# LIVES:  "+player.numLives, 440, 65);
    fill(255, 283, 5);
    text("SCORE:  "+player.score, 450, 40);
  } else if (screen==2) {
    drawh2p();
  } else if (screen==3) {
    drawhs();
  }

  if ((frameCount % 5 == 0) && (!eaten.isEmpty())) {
    reappear(eaten.dequeue());
  }

  //print("xcordinate: "+mouseX);
}

void setimages() {
  img=loadImage("startscreen.png");
  start1=loadImage("startbutton1.png");
  start2=loadImage("startbutton2.png");
  h2p1=loadImage("h2p1.png");
  h2p2=loadImage("h2p2.png");
  h2ptab=loadImage("h2ptab.png");
  hs1=loadImage("highscore1.png");
  hs2=loadImage("highscore2.png");
  highscoretab=loadImage("highscoretab.png");
  homebutton1=loadImage("homebutton1.png");
  homebutton2=loadImage("homebutton2.png");
  pacman=loadImage("pacman.png");
  pacman1=loadImage("pacman1.png");
  pacman2=loadImage("pacman2.png");
  pacman3=loadImage("pacman3.png");
  pacman4=loadImage("pacman4.png");
  redghost = loadImage("redghost.png");
  pinkghost = loadImage("pinkghost.png");
  orangeghost = loadImage("orangeghost.png");
  blueghost = loadImage("blueghost.png");
}

void mouseClicked() {
  if (overstart()) {
    screen=1;
  }
  if (overh2p()) {
    screen=2;
  }
  if (overhs()) {
    screen=3;
  }
  if (overhome()) {
    screen=0;
  }
}

//-----------------SCREENS----------------------------------
void drawStartScreen() {
  image(img, 0, 0);
  //start button
  if (overstart()) {
    image(start2, 230, 320);
  } else {
    image(start1, 230, 320);
  }
  //how to play button
  if (overh2p()) {
    image(h2p2, 140, 420);
  } else {
    image(h2p1, 140, 420);
  }

  if (overhs()) {
    image(hs2, 380, 420);
  } else {
    image(hs1, 380, 420);
  }
}

void drawh2p() { //draw how 2 play screen
  image(h2ptab, 0, 0);
  if (overhome()) {
    image(homebutton2, 0, 0);
  } else {
    image(homebutton1, 0, 0);
  }
  fill(255, 255, 255);
  text("The goal of the game is to get the highest", 80, 210); 
  text("number of points. You don't need to eat all", 80, 240); 
  text("the dots. Just don't get touched by a ghost!", 80, 270);
  fill(255, 25, 0);
  text("+Use the arrow keys to move", 170, 330); 
  text("+Eat power pellets to destroy ghosts!", 110, 350);
  text("+Bonus rounds once you reach 5000!", 120, 370);
  text("+You have 3 Lives!", 210, 390);

  fill(255, 238, 0);
  text("+Dots-10 points", 230, 450);
  text("+Ghosts-50 points", 200, 470);
  text("+Broccoli Tree-30 points!", 160, 490);
  fill (0, 25, 255);
  text("Get chompin', champ", 220, 550);
}

void drawhs() { //draw high score screen
  image(highscoretab, 0, 0);
  if (overhome()) {
    image(homebutton2, 0, 0);
  } else {
    image(homebutton1, 0, 0);
  }
}

boolean overstart() {
  if (mouseX>=240 && mouseX<=447 &&
    mouseY>=322 && mouseY<=378) {
    return true;
  } else {
    return false;
  }
}

boolean overh2p() {
  if (mouseX>=139 && mouseX<=297 &&
    mouseY>=421 && mouseY<=455) {
    return true;
  } else {
    return false;
  }
}

boolean overhs() {
  if (mouseX>=380 && mouseX<=540 &&
    mouseY>=421 && mouseY<=455) {
    return true;
  } else {
    return false;
  }
}

boolean overhome() {
  if (mouseX>=0 && mouseX<=102 &&
    mouseY>=0 && mouseY<=18) {
    return true;
  } else {
    return false;
  }
}

//---------------------------MAP------------------------------------
void setMap() {
  String[] lines = loadStrings("maze.txt");
  //println("there are " + lines.length + " lines");
  for (int r = 0; r < lines.length; r++) {
    for (int c = 0; c < lines.length; c++) {
      //println(lines[r].substring(c,c+1));
      map[r][c] = lines[r].substring(c, c+1);
    }
  }
}

void drawMap() {
  text("Score:" + player.score, 120, 0);
  if (overhome()) {
    image(homebutton2, 0, 0);
  } else {
    image(homebutton1, 0, 0);
  }
  for (int a = 0; a < map.length; a ++) {
    for (int b = 0; b < map[0].length; b++) {
      //power pellets
      if ( map[a][b].equals("p")) {
        stroke(255, 255, 0);
        noStroke();
        fill(255, 255, 0);
        ellipse(b*_blocksize+10, a*_blocksize+75+10, 12, 12);
      } 
      //normal dots
      else if (map[a][b].equals("d")) {
        noStroke();
        fill(255, 182, 193);
        ellipse(b*_blocksize+10, a*_blocksize+75+10, 4, 4);
      } 
      //broccoli tree
      else if (map[a][b].equals("b")) {
        //stroke(255, 0, 0);
        fill(255, 0, 0);
        rect(b*_blocksize, a*_blocksize+75, _blocksize, _blocksize);
      } 
      //PACMAN
      else if (map[a][b].equals("@")) {
        if (player.direction==1) {
          image(pacman1, b*_blocksize, a*_blocksize+75);
        } else if (player.direction==2) {
          image(pacman2, b*_blocksize, a*_blocksize+75);
        } else if (player.direction==3) {
          image(pacman3, b*_blocksize, a*_blocksize+75);
        } else if (player.direction==4) {
          image(pacman4, b*_blocksize, a*_blocksize+75);
        } else {
          image(pacman, b*_blocksize, a*_blocksize+75);
        }
      }
      //eaten dot space or place you have been
      else if (map[a][b].equals("x")) {
        fill(0, 0, 0);
        rect(b*_blocksize, a*_blocksize+75, _blocksize, _blocksize);
      }
      // Jail for ghosts:
      else if (map[a][b].equals("j")) {
        noStroke();
        fill(225, 225, 225);
        rect(b * _blocksize, a * _blocksize + 75, _blocksize, _blocksize);
      } else if (player.power==true) {
        //stuy walls
        if (map[a][b].equals("s")) {
          fill(255, 80, 80);
          rect(b*_blocksize, a*_blocksize+75, _blocksize, _blocksize);
        } else if (map[a][b].equals("t")) {
          fill(255, 176, 97);
          rect(b*_blocksize, a*_blocksize+75, _blocksize, _blocksize);
        } else if (map[a][b].equals("u")) {
          fill(255, 255, 80);
          rect(b*_blocksize, a*_blocksize+75, _blocksize, _blocksize);
        } else if (map[a][b].equals("y")) {
          fill(168, 255, 80);
          rect(b*_blocksize, a*_blocksize+75, _blocksize, _blocksize);
        } else {
          //stroke(0, 0, 255);
          fill(0, 0, 255);
          rect(b*_blocksize, a*_blocksize+75, _blocksize, _blocksize);
        }
      }

      //walls
      else {
        //stroke(0, 0, 255);
        fill(0, 0, 255);
        rect(b*_blocksize, a*_blocksize+75, _blocksize, _blocksize);
      }
    }
  }
}

//dots reappearing after 5 sec
void reappear(Dot x) {
  if (x.whatAmI == 1) {
    map[x.yPos][x.xPos] = "d";
  } else if (x.whatAmI == 2) {
    map[x.yPos][x.xPos] = "p";
  } else {
    map[x.yPos][x.xPos] = "b";
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      player.direction=1;
    } else if (keyCode == DOWN) {
      player.direction=2;
    } else if (keyCode == RIGHT) {
      player.direction=3;
    } else if (keyCode == LEFT) {
      player.direction=4;
    } else {
    }
  }
}