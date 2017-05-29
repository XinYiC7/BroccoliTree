// Team BroccoliTree
// Roster: Gian "Giant" Tricarico, Xin Yi Chen, Melanie "MChow" Chow
// APCS2 pd4

/*
facilitates progress of tower minigame (helper method for draw)
 */
void miniGame()
{
  // Implementation (after completion of MVP)
}
int _blocksize=30;
String[][] map = new String[32][32];
void setup() {
  size(960, 960);
  background(0, 0, 0);
  setMap();
}
void draw() {
  for (int a = 0; a < map.length; a ++) {
    for (int b = 0; b < map[0].length; b++) {

      if ( map[a][b].equals("p")) {
        fill(255, 255, 0);
        rect(b*_blocksize, a*_blocksize, _blocksize, _blocksize);
      } 
      else if (map[a][b].equals("d")) {
        fill(255,255,255);
        rect(b*_blocksize, a*_blocksize, _blocksize, _blocksize);
      } 
      else if (map[a][b].equals("t")) {
        fill(255, 0, 0);
        rect(b*_blocksize, a*_blocksize, _blocksize, _blocksize);
      } 
      else {
        fill(0, 0, 255);
        rect(b*_blocksize, a*_blocksize, _blocksize, _blocksize);
      }
    }
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