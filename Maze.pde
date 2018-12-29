class Maze {
 Wall[] walls; 
 int mazeSize= 0;
 Maze(int size){
   walls = new Wall[size];
 }
 
 
 void addWall(PVector TopLeft, PVector BottomRight){
     walls[mazeSize]= new Wall(TopLeft,BottomRight);   
     mazeSize++;
 }
  
   void addWall(Wall wall ){
     walls[mazeSize]= wall;   
     mazeSize++;
 }
 void show(){
      for (int i =0; i<mazeSize;i++)
   {
    walls[i].show(); 
   }
   
   
 }
  
  
 boolean collisionHandling(Dot dot){
   for (int i =0; i<mazeSize;i++)
   {
     if(walls[i].hasColided(dot.pos) || walls[i].willColide(dot.pos,dot.vel)){
       dot.wallTouched= walls[i].density ;
      return true; 
     }

     
   }
   
   
  return false; 
 }
  
  
  
}
