// Team BroccoliTree
// Roster: Gian "Giant" Tricarico, Xin Yi Chen, Melanie "MChow" Chow
// APCS2 pd4

//------------------------ Instance variables ------------------------

// Each block in the game's grid is made up of _blocksize * _blocksize pixels:
int _blocksize = 20;
Player player = new Player(null);
// 3D array for use in filling the processing window:
static String[][] map = new String[32][32];
int screen=0; //determines what is being shown on the screen 0=start 1=pacman 2=tower, etc
PImage img; //startscreen
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
  img=loadImage("startscreen.png");
}

void draw() {
  if (screen==0) {
    image(img, 0, 0);
  } 
  else if (screen==1) {
    background(0, 0, 0);
    drawMap();
    frameRate(7);
    player.move(player.direction);
    print(player.direction);
  }
}

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

void mouseClicked() {
  screen=1;
}

void drawMap() {
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
      //start point
      else if (map[a][b].equals("@")) {
        fill(255, 255, 255);
        ellipse(b*_blocksize+10, a*_blocksize+75+10, _blocksize, _blocksize);
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
      } 
      else if (player.power==true) {
        //stuy walls
        if (map[a][b].equals("s")) {
          fill(255, 80, 80);
          rect(b*_blocksize, a*_blocksize+75, _blocksize, _blocksize);
        }
        else if (map[a][b].equals("t")) {
          fill(255, 176, 97);
          rect(b*_blocksize, a*_blocksize+75, _blocksize, _blocksize);
        }
        else if (map[a][b].equals("u")) {
          fill(255, 255, 80);
          rect(b*_blocksize, a*_blocksize+75, _blocksize, _blocksize);
        }
        else if (map[a][b].equals("y")) {
          fill(168, 255, 80);
          rect(b*_blocksize, a*_blocksize+75, _blocksize, _blocksize);
        }
        else {
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

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
         player.direction=1;
    }
    else if (keyCode == DOWN) {
        player.direction=2;

    } 
    else if (keyCode == RIGHT) {
         player.direction=3;
       
    } 
    else if (keyCode == LEFT) {
         player.direction=4;
       
    } 
    else {
    }
  }
}