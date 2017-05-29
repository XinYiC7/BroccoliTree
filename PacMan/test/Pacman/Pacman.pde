int _size=650;
int _blocksize=10;
int _map=65;

Block[] map=new Block[650*300];


  void setup(){
   size(960,960);
   background(0,0,0);
   for (int i=0; i<map.length; i++){
      if (i<_map){
        map[i]=new Block(0, 0, color(255,192,255),1);
      }
      else{
        map[i]=new Block();
      }
   }
  }


  void draw(){
    background(0,0,0);
    for (int i=0; i<map.length; i++){
      fill(map[i].c);
      rect(i*_blocksize,map[i].y,_blocksize,_blocksize);
    }
  }
  
  