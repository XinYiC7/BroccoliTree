// Team BroccoliTree
// Roster: Gian "Giant" Tricarico, Xin Yi Chen, Melanie "MChow" Chow
// APCS2 pd4

// The dots that Pacman eats
static class Dot{
 //int point;
 //color c;
 int xPos;
 int yPos;
 //boolean isEaten;
 int whatAmI; //1:normal dot, 2:PowerPellet, 3:BroccoliTree
 
 Dot(int Iam, int x, int y){
   whatAmI = Iam;
   xPos = x;
   yPos = y;
 }

}