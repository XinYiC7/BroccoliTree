// Team BroccoliTree
// Roster: Gian "Giant" Tricarico, Xin Yi Chen, Melanie "MChow" Chow
// APCS2 pd4

// import java.util.ArrayList; already imported by Processing
import java.util.LinkedList;
// import java.util.concurrent.LinkedBlockingQueue;
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
Boolean endRound = false;
int endRoundCtr = 0;
//eaten dots
LLQueue<Dot> eaten = new LLQueue<Dot>();
LinkedList<Ghost> liveGhosts;
LLQueue<Ghost> jailedGhosts;

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
PImage weakghost;

PImage broctree;
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
  jailedGhosts = new LLQueue<Ghost>();
  jailedGhosts.enqueue(Blinky);
  jailedGhosts.enqueue(Pinky);
  jailedGhosts.enqueue(Inky);
  jailedGhosts.enqueue(Clyde);
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

    if (frameCount % 36 == 0) { // every 36 frames = 6 secs
      parole();
    }

    // for ( Ghost g : liveGhosts ) { Makes the program crash after a little while for some reason
      for (int i = 0; i < liveGhosts.size(); i+=1) {
      //delay(500);
      // g.move();
      liveGhosts.get(i).move();
    }

    if (endRoundCtr == 12) {
      endRound = false;
      endRoundCtr = 0;
    }
    if (endRound == true) {
      endRoundScreen();
    }
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

  //dots reappear after 4 seconds
  if ((frameCount % 24 == 0) && (!eaten.isEmpty()) && (player.xPos != eaten.peekFront().xPos) && (player.yPos != eaten.peekFront().yPos)) {
    reappear(eaten.dequeue());
  }

  //print("xcoordinate: "+mouseX);
  //print("ycoordinate:-->"+mouseY);
}

// Takes a Ghost out of the jail, if there are any in the jail
Ghost parole()
{
  Ghost freedGhost;
  try {
    freedGhost = jailedGhosts.dequeue();
  }
  catch (NullPointerException exception) {
    return null;
  }
  // if (freedGhost != null) {
  map[freedGhost.yPos][freedGhost.xPos] = "j";
  //println(map[freedGhost.yPos][freedGhost.xPos]);
  freedGhost.xPos = 16;
  freedGhost.yPos = 14;
  map[freedGhost.yPos][freedGhost.xPos] = freedGhost.identity;
  freedGhost.state = 1;
  liveGhosts.add(freedGhost);
  // }
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
  weakghost= loadImage("weakghost.png");
  broctree=loadImage("broctree.png");
}

void setScores() {
  String[] scorelines=loadStrings("highscores.txt");
  for (int i=0; i<scorelines.length; i++) {
    String[] separate=split(scorelines[i], ",");
    if (separate.length==2) {
      hsnames.add(separate[0]);
      highscores.add(int(separate[1]));
    }
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
  text("number of points. You don't need to eat ALL", 80, 240); 
  text("the dots. Just don't get touched by a ghost!", 80, 270);
  fill(255, 25, 0);
  text("+Use the arrow keys to move", 150, 330); 
  text("+Eat power pellets to destroy a ghost!", 100, 350);
  text("+Once you eat a ghost, your power is OVER.", 90, 370);
  text("+The pellets reappear!", 190, 390);
  text("+You have 3 Lives, then you're out!", 140, 410);

  fill(255, 238, 0);
  text("+Dots-10 points", 230, 450);
  text("+Broccoli Tree-30 points!", 200, 470);
  text("+Ghosts-100 points", 160, 490);
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
        hsnames.add(i, "NO NAME");
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
  map[player.yPos][player.xPos] = "#";
  player.xPos = 24;
  player.yPos = 28;
  map[28][24] = "@";
  this.endRound = true;
  /*
  Player newRound=new Player();
   newRound.score=player.score;
   newRound.name=player.name;
   newRound.numLives=player.numLives;
   player=newRound;*/
}

void endRoundScreen() {
  background(0);
  fill(255, 255, 255);
  text("oops! you lost a life. You have "+player.numLives+" lives left.", 90, 100);
  endRoundCtr ++;
  //delay(3000);
}

void endGame() {
  background(0, 0, 0);
  screen=0;
  setMap();
  Player newguy=new Player();
  newguy.name=player.name;
  player.numLives=3;
  player=newguy;
  scoreSubmitted=false;
  /*Ghost blinky = new Ghost("1", 15, 16);
  Blinky=blinky;
  Ghost pinky = new Ghost("2", 17, 16);
  Pinky=pinky;
  Ghost inky = new Ghost("3", 15, 17);
  Inky=inky;
  Ghost clyde = new Ghost("4", 17, 17);
  Clyde=clyde;
  LLQueue<Ghost> JailedGhosts = new LLQueue<Ghost>();
  JailedGhosts.enqueue(Blinky);
  JailedGhosts.enqueue(Pinky);
  JailedGhosts.enqueue(Inky);
  JailedGhosts.enqueue(Clyde);
  jailedGhosts=JailedGhosts;
  */
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
        image(broctree,b*_blocksize, a*_blocksize+75);
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
        if (player.state == 2) {
          image(weakghost,b*_blocksize, a*_blocksize +75);
          Blinky.state=2;
        }
        else{
        image(redghost, b * _blocksize, a * _blocksize + 75);
      }
      }
      // Pink Ghost:
      else if ( map[a][b].equals("2") ) {
        if (player.state == 2) {
          image(weakghost,b*_blocksize, a*_blocksize +75);
          Pinky.state=2;
        }
        else{
        image(pinkghost, b * _blocksize, a * _blocksize + 75);
      }
      }

      // Blue (Cyan) Ghost:
      else if ( map[a][b].equals("3") ) {
        if (player.state == 2) {
          image(weakghost,b*_blocksize, a*_blocksize +75);
          Inky.state=2;
        }
        else{
        image(blueghost, b * _blocksize, a * _blocksize + 75);
      }
      }

      // Orange Ghost:
      else if ( map[a][b].equals("4") ) {
        if (player.state == 2) {
          image(weakghost,b*_blocksize, a*_blocksize +75);
          Clyde.state=2;
        }
        else{
        image(orangeghost, b * _blocksize, a * _blocksize + 75);
      }
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