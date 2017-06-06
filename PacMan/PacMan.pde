// Team BroccoliTree
// Roster: Gian "Giant" Tricarico, Xin Yi Chen, Melanie "MChow" Chow
// APCS2 pd4

// import java.util.ArrayList; already imported by Processing
import java.util.LinkedList;
import java.util.concurrent.LinkedBlockingQueue;
//------------------------ Instance variables ------------------------

// Each block in the game's grid is made up of _blocksize * _blocksize pixels:
int _blocksize = 20;

Player player = new Player();
Ghost Blinky; // red Ghost
Ghost Pinky; // pink Ghost
Ghost Inky; // blue (cyan) Ghost
Ghost Clyde; // orange Ghost
// 3D array for use in filling the processing window:
static String[][] map = new String[32][32];
static ArrayList<Integer> highscores= new ArrayList<Integer>(10);
static ArrayList<String> hsnames=new ArrayList<String>(10);
Boolean scoreSubmitted = false;
//eaten dots
LinkedBlockingQueue<Dot> eaten = new LinkedBlockingQueue<Dot>();
LinkedList<Ghost> liveGhosts;
LinkedBlockingQueue<Ghost> jailedGhosts;

// int counter = 0; //We can use the built-in variable frameCount instead.

int screen=0; //determines what is being shown on the screen 0=start 1=pacman 2=tower, etc
Boolean setName=false;
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
  Blinky = new Ghost("1", 15, 16);
  Pinky = new Ghost("2", 17, 16);
  Inky = new Ghost("3", 15, 17);
  Clyde = new Ghost("4", 17, 17);
  jailedGhosts = new LinkedBlockingQueue<Ghost>();
  jailedGhosts.add(Blinky);
  jailedGhosts.add(Pinky);
  jailedGhosts.add(Inky);
  jailedGhosts.add(Clyde);
  liveGhosts = new LinkedList<Ghost>();
  setMap();
  setimages();
  font=createFont("imagine_font.ttf", 20);
  textFont(font);
  textAlign(LEFT, LEFT);
  setScores();
}

void draw() {

  if (screen==0) {
    endGame();
    drawStartScreen();
  } else if (screen==1) {
    // counter ++;
    background(0, 0, 0);
    drawMap();
    frameRate(6);
    player.move();

    if (frameCount % 10 == 0) { // every 10 frames
      parole();
    }

    for ( Ghost g : liveGhosts ) {
      g.move();
    }

    /*
      //Blinky
     if ( frameCount == 5) {
     map[Blinky.yPos][Blinky.xPos] = "j";
     //println(map[Blinky.yPos][Blinky.xPos]);
     Blinky.xPos = 16;
     Blinky.yPos = 14;
     map[Blinky.yPos][Blinky.xPos] = "1";
     Blinky.startMove = 1;
     }
     if (Blinky.startMove == 1) {
     Blinky.move();
     }
     
     //Pinky
     if ( frameCount == 20) {
     map[Pinky.yPos][Pinky.xPos] = "j";
     //println(map[Pinky.yPos][Pinky.xPos]);
     Pinky.xPos = 16;
     Pinky.yPos = 14;
     map[Pinky.yPos][Pinky.xPos] = "2";
     Pinky.startMove = 1;
     }
     if (Pinky.startMove == 1) {
     Pinky.move();
     }
     
     //Inky
     if ( frameCount == 30) {
     map[Inky.yPos][Inky.xPos] = "j";
     //println(map[Inky.yPos][Inky.xPos]);
     Inky.xPos = 16;
     Inky.yPos = 14;
     map[Inky.yPos][Inky.xPos] = "3";
     Inky.startMove = 1;
     }
     //println(counter);
     if (Inky.startMove == 1) {
     Inky.move();
     }
     
     //Clyde
     if ( frameCount == 40) {
     map[Clyde.yPos][Clyde.xPos] = "j";
     //println(map[Clyde.yPos][Clyde.xPos]);
     Clyde.xPos = 16;
     Clyde.yPos = 14;
     map[Clyde.yPos][Clyde.xPos] = "4";
     Clyde.startMove = 1;
     }
     //println(counter);
     if (Clyde.startMove == 1) {
     Clyde.move();
     }
     */

    //print(player.direction);
    fill(255, 255, 255);
    if (player.name.length()==0) {
      text("NAME: Start Typing to Enter", 60, 50);
    } else {
      text("NAME:  "+player.name, 60, 50);
    }
    fill (255, 25, 0);
    text("# LIVES:  "+player.numLives, 440, 65);
    fill(255, 283, 5);
    text("SCORE:  "+player.score, 450, 40);
  } else if (screen==2) {
    drawh2p();
  } else if (screen==3) {
    drawhs();
  }

  //dots reappear after 5 seconds
  if ((frameCount % 5 == 0) && (!eaten.isEmpty()) && (player.xPos != eaten.peek().xPos) && (player.yPos != eaten.peek().yPos)) {
    reappear(eaten.remove());
  }

  //print("xcoordinate: "+mouseX);
  //print("ycoordinate:-->"+mouseY);
}

// Takes a Ghost out of the jail, if there are any in the jail
Ghost parole()
{
  Ghost freedGhost = jailedGhosts.poll();
  if (freedGhost != null) {
    map[freedGhost.yPos][freedGhost.xPos] = "j";
    //println(map[freedGhost.yPos][freedGhost.xPos]);
    freedGhost.xPos = 16;
    freedGhost.yPos = 14;
    map[freedGhost.yPos][freedGhost.xPos] = freedGhost.identity;
    freedGhost.state = 1;
    liveGhosts.add(freedGhost);
  }
  return freedGhost;
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

void setScores() {
  String[] scorelines=loadStrings("highscores.txt");
  for (int i=0; i<scorelines.length; i++) {
    String[] separate=split(scorelines[i], ",");
    hsnames.add(separate[0]);
    highscores.add(int(separate[1]));
  }
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
  text("Your score: "+ player.score, 230, 200);
  if (!scoreSubmitted) {
    insertScore(player.score);
  }
  for (int i=0; i<10; i++) {
    if (i>hsnames.size()-1) {
      text(i+1+". ", 200, 270+(20*i));
    } else {
      text(i+1+". "+hsnames.get(i)+" :  "+highscores.get(i), 200, 270+(20*i));
    }
  }
  if (overhome()) {
    image(homebutton2, 0, 0);
  } else {
    image(homebutton1, 0, 0);
  }
}

boolean insertScore(int score) {
  String input="";
  scoreSubmitted=true;
  for (int i=0; i<highscores.size(); i++) {
    if (score>highscores.get(i)) {
      highscores.add(i, score);
      if (player.name.equals("")) {
        hsnames.add(i, "NONAME");
      } else {
        hsnames.add(i, player.name);
      }
      for (int j=0; j<highscores.size(); j++) {
        input+=hsnames.get(j)+","+highscores.get(j)+" ";
      }
      String[] newhs=split(input, " ");
      saveStrings("highscores.txt", newhs);
      return true;
    }
  } 
  return false;
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

void endRound() {
  fill(255, 255, 255);
  text("oops! you lost a life. You have "+player.numLives+" lives left.", 90, 100);
  Player newRound=new Player();
  newRound.score=player.score;
  newRound.name=player.name;
  newRound.numLives=player.numLives;
  player=newRound;
}

void endGame() {
  background(0, 0, 0);
  screen=0;
  setMap();
  Player newguy=new Player();
  newguy.name=player.name;
  player.numLives=3;
  player=newguy;
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

      // Red Ghost:
      else if ( map[a][b].equals("1") ) {
        if (Blinky.state == 0) {
        }
        image(redghost, b * _blocksize, a * _blocksize + 75);
      }

      // Pink Ghost:
      else if ( map[a][b].equals("2") ) {
        if (Pinky.state == 0) {
        }
        image(pinkghost, b * _blocksize, a * _blocksize + 75);
      }

      // Blue (Cyan) Ghost:
      else if ( map[a][b].equals("3") ) {
        if (Inky.state == 0) {
        }
        image(blueghost, b * _blocksize, a * _blocksize + 75);
      }

      // Orange Ghost:
      else if ( map[a][b].equals("4") ) {
        if (Clyde.state == 0) {
        }
        image(orangeghost, b * _blocksize, a * _blocksize + 75);
      }
      // Jail for ghosts:
      else if (map[a][b].equals("j")) {
        noStroke();
        fill(0, 0, 0);
        rect(b * _blocksize, a * _blocksize + 75, _blocksize, _blocksize);
      }
      // Stuy walls
      else if (player.state==2) {
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
      } // end else statement
    } // end inner for loop
  } // end outer for loop
} // end void drawMap()

//dots reappearing after 5 sec
void reappear(Dot x) {
  if (x.whatAmI == 1) {
    //normal dots
    map[x.yPos][x.xPos] = "d";
  } else if (x.whatAmI == 2) {
    //power pellets
    map[x.yPos][x.xPos] = "p";
  } else {
    //broccoli tree
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
  } else {
    if (setName) {
    } else {
      if (key==ENTER | key==RETURN) {
        setName=true;
      } else if (key==BACKSPACE) {
        if (player.name.length()>=1) {
          player.name=player.name.substring(0, player.name.length()-1);
        } else {
        }
      } else {
        player.name+=key;
      }
    }
  }
}