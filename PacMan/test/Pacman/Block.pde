class Block{
  color c;
  int type; //0 = path 1=map wall 2=dot space
  int x;
  int y;

  Block(){
    c=color(0,0,0);
    type=0;
    x=0;
    y=0;
  }
  Block(int xpos, int ypos,color _color,int _type){
    x=xpos;
    y=ypos;
    c=_color;
    type=_type;
  }
    
}